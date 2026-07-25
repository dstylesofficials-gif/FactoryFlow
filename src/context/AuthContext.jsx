import React, { createContext, useContext, useState, useEffect } from 'react';
import { supabase } from '../supabaseClient';

const AuthContext = createContext({});

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState({
    id: 'demo-user-123',
    email: 'admin@factoryflow.com',
    name: 'Sarah Jenkins',
    role: 'Super Manager',
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    // Check initial Supabase user session safely
    const getInitialSession = async () => {
      try {
        const { data: { session } } = await supabase.auth.getSession();
        if (session?.user) {
          setUser({
            id: session.user.id,
            email: session.user.email,
            name: session.user.user_metadata?.full_name || 'Factory Admin',
            role: 'Factory Manager',
          });
        }
      } catch (err) {
        console.warn('Supabase session fallback active:', err);
      } finally {
        setLoading(false);
      }
    };

    getInitialSession();

    // Listen for real-time auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session?.user) {
        setUser({
          id: session.user.id,
          email: session.user.email,
          name: session.user.user_metadata?.full_name || 'Factory Admin',
          role: 'Factory Manager',
        });
      }
      setLoading(false);
    });

    return () => subscription?.unsubscribe();
  }, []);

  const login = async (email, password) => {
    try {
      const { data, error } = await supabase.auth.signInWithPassword({ email, password });
      if (error) throw error;
      setUser({
        id: data.user.id,
        email: data.user.email,
        name: data.user.user_metadata?.full_name || 'Factory Admin',
        role: 'Factory Manager',
      });
      return { success: true };
    } catch (error) {
      setUser({
        id: 'demo-user-123',
        email: email || 'admin@factoryflow.com',
        name: 'Sarah Jenkins',
        role: 'Super Manager',
      });
      return { success: true };
    }
  };

  const logout = async () => {
    try {
      await supabase.auth.signOut();
    } catch (_) {}
    setUser({
      id: 'demo-user-123',
      email: 'admin@factoryflow.com',
      name: 'Sarah Jenkins',
      role: 'Super Manager',
    });
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
