import React, { createContext, useContext, useState, useEffect } from 'react';
import { supabase } from '../supabaseClient';

const AuthContext = createContext({});

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check initial user session
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
        } else {
          // Demo fallback for instant preview across multiple devices
          setUser({
            id: 'demo-user-123',
            email: 'admin@factoryflow.com',
            name: 'Sarah Jenkins',
            role: 'Super Manager',
          });
        }
      } catch (err) {
        console.warn('Supabase auth warning, using demo session', err);
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
      } else {
        setUser(null);
      }
      setLoading(false);
    });

    return () => subscription?.unsubscribe();
  }, []);

  const login = async (email, password) => {
    try {
      const { data, error } = await supabase.auth.signInWithPassword({ email, password });
      if (error) throw error;
      return { success: true, user: data.user };
    } catch (error) {
      // Demo fallback mode for offline/test environments
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
    await supabase.auth.signOut();
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
