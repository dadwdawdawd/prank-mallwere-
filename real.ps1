Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- Create funny icon (eyes + red nose) ---
$bmp = New-Object System.Drawing.Bitmap 32,32
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::Transparent)

# Eyes
$g.FillEllipse([System.Drawing.Brushes]::Black, 6, 8, 6, 6)
$g.FillEllipse([System.Drawing.Brushes]::Black, 20, 8, 6, 6)

# Nose
$g.FillEllipse([System.Drawing.Brushes]::Red, 14, 16, 6, 6)

# Convert to icon
$ms = New-Object System.IO.MemoryStream
$bmp.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)
$icon = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap($ms)).GetHicon())

# --- Create 20 scattered windows ---
$forms = @()
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$rand = New-Object System.Random

for ($i = 1; $i -le 20; $i++) {

    $form = New-Object Windows.Forms.Form
    $form.Text = "SYSTEM SECURITY ALERT"
    $form.Size = New-Object Drawing.Size(420,200)
    $form.BackColor = "Black"
    $form.TopMost = $true
    $form.Icon = $icon

    # Random scatter position
    $x = $rand.Next(0, $screen.Width - $form.Width)
    $y = $rand.Next(0, $screen.Height - $form.Height)
    $form.StartPosition = "Manual"
    $form.Location = New-Object Drawing.Point($x, $y)

    # Label
    $label = New-Object Windows.Forms.Label
    $label.Text = "PUT BETTER ANTIMALWARE BUD 😆"
    $label.ForeColor = "Lime"
    $label.Font = New-Object Drawing.Font("Consolas",14,[Drawing.FontStyle]::Bold)
    $label.AutoSize = $true
    $label.Location = New-Object Drawing.Point(40,80)

    $form.Controls.Add($label)
    $forms += $form
}

# --- Close all when one closes ---
foreach ($f in $forms) {
    $f.Add_FormClosing({
        foreach ($other in $forms) {
            try { $other.Close() } catch {}
        }
    })
}

# --- Show all windows ---
foreach ($f in $forms) { $f.Show() }
[System.Windows.Forms.Application]::Run()
