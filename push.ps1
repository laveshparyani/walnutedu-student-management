# PowerShell script to push to GitHub via WSL
# Run this script in PowerShell

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Pushing Student Management App to GitHub" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$wslPath = "/home/lavesh/frappe-bench/apps/student_management"

Write-Host "Step 1: Checking git status..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git status"

Write-Host "`nStep 2: Initializing git if needed..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && if [ ! -d .git ]; then git init; fi"

Write-Host "`nStep 3: Configuring git user..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git config user.name 'Lavesh Paryani'"
wsl bash -c "cd $wslPath && git config user.email 'laveshparyani01@gmail.com'"

Write-Host "`nStep 4: Adding remote repository..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git remote remove origin 2>/dev/null || true"
wsl bash -c "cd $wslPath && git remote add origin https://github.com/laveshparyani/walnutedu-student-management.git"

Write-Host "`nStep 5: Adding all files..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git add ."

Write-Host "`nStep 6: Committing changes..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git commit -m 'Add comprehensive README with setup instructions, screenshots, challenges, and project documentation' || git commit -m 'Add comprehensive README with setup instructions, screenshots, challenges, and project documentation' --allow-empty"

Write-Host "`nStep 7: Setting branch to main..." -ForegroundColor Yellow
wsl bash -c "cd $wslPath && git branch -M main 2>/dev/null || true"

Write-Host "`nStep 8: Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "⚠ You may be prompted for GitHub credentials" -ForegroundColor Red
Write-Host ""

wsl bash -c "cd $wslPath && git push -u origin main"

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n==========================================" -ForegroundColor Green
    Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "`nRepository URL: https://github.com/laveshparyani/walnutedu-student-management" -ForegroundColor Cyan
} else {
    Write-Host "`n==========================================" -ForegroundColor Red
    Write-Host "⚠ Push failed. Please check:" -ForegroundColor Red
    Write-Host "==========================================" -ForegroundColor Red
    Write-Host "1. GitHub authentication (use Personal Access Token)" -ForegroundColor Yellow
    Write-Host "2. Repository access permissions" -ForegroundColor Yellow
    Write-Host "3. Network connectivity" -ForegroundColor Yellow
    Write-Host "`nTo push manually, run in WSL:" -ForegroundColor Yellow
    Write-Host "  cd ~/frappe-bench/apps/student_management" -ForegroundColor White
    Write-Host "  git push -u origin main" -ForegroundColor White
}

