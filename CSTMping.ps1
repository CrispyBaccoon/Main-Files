$server = "google-public-dns-a.google.com"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Request Entry Form'
$form.Size = New-Object System.Drawing.Size(400,200)
$form.StartPosition = 'CenterScreen'

#$Icon = New-Object system.drawing.icon ("C:\Windows\Installer\{FFD1F7F1-1AC9-4BC4-A908-0686D635ABAF}\installer.ico")
#$form.Icon = $Icon

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(90,110)
$okButton.Size = New-Object System.Drawing.Size(125,30)
$okButton.Text = 'Send Request'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(225,110)
$cancelButton.Size = New-Object System.Drawing.Size(75,30)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$CCBox = New-Object System.Windows.Forms.Listbox
$CCBox.Location = New-Object System.Drawing.Point(310,110)
$CCBox.Size = New-Object System.Drawing.Size(40,30)
$CCBox.SelectionMode = 'MultiExtended'
[void] $CCBox.Items.Add('CC')
[void] $CCBox.Items.Add('')
$CCBox.Height = 30
$form.Controls.Add($CCBox)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(30,0)
$label.Size = New-Object System.Drawing.Size(350,16)
$label.Text = 'Enter Request Form: '
$form.Controls.Add($label)

$PSlabel = New-Object System.Windows.Forms.Label
$PSlabel.Location = New-Object System.Drawing.Point(40,18)
$PSlabel.Size = New-Object System.Drawing.Size(120,20)
$PSlabel.Text = 'Package Size: '
$form.Controls.Add($PSlabel)

$PSBox = New-Object System.Windows.Forms.TextBox
$PSBox.Location = New-Object System.Drawing.Point(160,18)
$PSBox.Size = New-Object System.Drawing.Size(128,20)
$form.Controls.Add($PSBox)

$PClabel = New-Object System.Windows.Forms.Label
$PClabel.Location = New-Object System.Drawing.Point(40,40)
$PClabel.Size = New-Object System.Drawing.Size(120,20)
$PClabel.Text = 'Package Count: '
$form.Controls.Add($PClabel)

$PCBox = New-Object System.Windows.Forms.TextBox
$PCBox.Location = New-Object System.Drawing.Point(160,40)
$PCBox.Size = New-Object System.Drawing.Size(128,20)
$form.Controls.Add($PCBox)

$RClabel = New-Object System.Windows.Forms.Label
$RClabel.Location = New-Object System.Drawing.Point(40,62)
$RClabel.Size = New-Object System.Drawing.Size(120,20)
$RClabel.Text = 'Request Count: '
$form.Controls.Add($RClabel)

$RCBox = New-Object System.Windows.Forms.TextBox
$RCBox.Location = New-Object System.Drawing.Point(160,62)
$RCBox.Size = New-Object System.Drawing.Size(128,20)
$form.Controls.Add($RCBox)

$SVlabel = New-Object System.Windows.Forms.Label
$SVlabel.Location = New-Object System.Drawing.Point(40,84)
$SVlabel.Size = New-Object System.Drawing.Size(120,20)
$SVlabel.Text = 'Server (optional): '
$form.Controls.Add($SVlabel)

$SVBox = New-Object System.Windows.Forms.TextBox
$SVBox.Location = New-Object System.Drawing.Point(160,84)
$SVBox.Size = New-Object System.Drawing.Size(128,20)
$form.Controls.Add($SVBox)

$form.Topmost = $true

$form.Add_Shown({$PSBox.Select()})
$result = $form.ShowDialog()

if ( ($result -eq [System.Windows.Forms.DialogResult]::OK) -or ($result -eq [System.Windows.Forms.DialogResult]::None) )
{
    $PackageSize = $PSBox.Text
    $PackageCount = $PCBox.Text
    $RequestCount = $RCBox.Text
    if ( $SVBox.Text -ne "" ) { $server = $SVBox.Text }
    $sel = $CCBox.SelectedItems
   if ( $sel -eq "CC" ) {

    Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please make a selection from the list below:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.Listbox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)

$listBox.SelectionMode = 'MultiExtended'

[void] $listBox.Items.Add('google.com')
[void] $listBox.Items.Add('google-public-dns-a.google.com')
[void] $listBox.Items.Add('gobiernu.cw')
[void] $listBox.Items.Add('Item 4')
[void] $listBox.Items.Add('Item 5')

$listBox.Height = 70
$form.Controls.Add($listBox)
$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $server = $listBox.SelectedItems
}
}

$tmpf = New-TemporaryFile
$tmptt = New-TemporaryFile

for ( $i = 1; $i -le ($RequestCount); $i++) {
Write-Progress -Activity "Pinging $server" -Status "Sending Packages. $i of $RequestCount" -PercentComplete ( ( $i / $RequestCount ) * 100 )

ping -n $PackageCount -l $PackageSize $server > $tmpf
$content = Get-Content -path $tmpf -Tail 1
$content.Substring(46) >> $tmptt

Write-Progress -Activity "Pinging $server" -Status "Packages Sent. $i of $RequestCount" -PercentComplete ( ( $i / $RequestCount ) * 100 )
}

$alltime = Get-Content -Path $tmptt
$alltime.trim("ms") > $tmptt
$mesr = Get-Content -Path $tmptt | Measure-Object -Average -Maximum -Minimum
$minimum = $mesr.Minimum
$maximum = $mesr.Maximum
$average = $mesr.Average


Add-Type -AssemblyName PresentationCore,PresentationFramework

$msgBody = "
Minimum Ping = $minimum ms
Maximum Ping = $maximum ms
Average Ping = $average ms
"
$msgTitle = "Request Result"
$msgButton = 'OK'
$msgImage = 'None'
$Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)

}
