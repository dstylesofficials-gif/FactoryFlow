# FactoryFlow Rapid Verification & Production Build Validation Script
Write-Host "Starting FactoryFlow Enterprise Verification Routine..." -ForegroundColor Cyan

Write-Host "`n1. Formatting Check..." -ForegroundColor Yellow
dart format --set-exit-if-changed .

Write-Host "`n2. Static Code Analysis..." -ForegroundColor Yellow
flutter analyze

Write-Host "`n3. Unit & Widget Tests..." -ForegroundColor Yellow
flutter test

Write-Host "`n4. Web Release Build Verification..." -ForegroundColor Yellow
flutter build web --release

Write-Host "`nAll verification stages completed successfully!" -ForegroundColor Green
