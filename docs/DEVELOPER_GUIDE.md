# FactoryFlow Developer Onboarding & Code Quality Standards

## 1. Code Quality Rules

1. **Single Responsibility Principle (SRP)**: Every file must serve a single domain purpose.
2. **Zero Hardcoded Secrets**: Always read configuration tokens via `EnvConfig` and `.env`.
3. **Immutability & Typing**: Data models must extend `Equatable` and use final fields.
4. **Error Handling**: Use domain `Failure` classes for returning predictable errors instead of rethrowing raw runtime exceptions to UI.

---

## 2. Verification Workflows

Before pushing any commit to GitHub:

```powershell
# Format code automatically
dart format .

# Check static analysis for zero warnings
flutter analyze

# Execute test suite
flutter test
```
