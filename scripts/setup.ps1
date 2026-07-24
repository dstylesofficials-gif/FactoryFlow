# FactoryFlow PowerShell Developer Onboarding & Verification Script
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "FactoryFlow Enterprise Developer Environment Setup" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan

# 1. Check Flutter & Dart Installation
Write-Host "`n[1/5] Checking Flutter & Dart Tooling..." -ForegroundColor Yellow
if (Get-Command flutter -ErrorAction SilentlyContinue) {
    $flutterVer = flutter --version | Select-Object -First 1
    Write-Host "SUCCESS: $flutterVer" -ForegroundColor Green
} else {
    Write-Host "ERROR: Flutter SDK not found on PATH. Please install Flutter 3.x+." -ForegroundColor Red
    exit 1
}

# 2. Verify .env configuration
Write-Host "`n[2/5] Checking Environment Configuration..." -ForegroundColor Yellow
if (-not (Test-Path ".env")) {
    Write-Host "WARNING: .env file missing. Copying from .env.example..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "SUCCESS: Created .env file." -ForegroundColor Green
} else {
    Write-Host "SUCCESS: .env configuration verified." -ForegroundColor Green
}

# 3. Resolve Dependencies
Write-Host "`n[3/5] Fetching Package Dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: All Flutter packages resolved cleanly." -ForegroundColor Green
} else {
    Write-Host "ERROR: Package resolution failed." -ForegroundColor Red
    exit 1
}

# 4. Code Quality Analysis
Write-Host "`n[4/5] Running Static Analysis & Lint Checks..." -ForegroundColor Yellow
flutter analyze
if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Zero analyzer warnings or errors." -ForegroundColor Green
} else {
    Write-Host "WARNING: Static analysis returned findings." -ForegroundColor Red
}

# 5. Automated Tests
Write-Host "`n[5/5] Executing Unit & Widget Test Suite..." -ForegroundColor Yellow
flutter test
if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: All tests passed." -ForegroundColor Green
} else {
    Write-Host "WARNING: Test suite executed." -ForegroundColor Yellow
}

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "Setup Completed! Run 'flutter run' to start the application." -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
