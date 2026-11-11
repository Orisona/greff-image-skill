Add-Type -AssemblyName System.Drawing
$p='D:\Codex\Воронки\FS-010-1\'
$im=[System.Drawing.Bitmap]::new($p+'обложка-11-11-вариант-1.png')
$clean=[System.Drawing.Bitmap]::new('C:\Users\Julia\.codex\generated_images\01a1afd5-3811-7e50-97a9-ed12cd3a59f5\exec-f85d43a5-a493-4417-92fc-43feaab419e7.png')
$g=[System.Drawing.Graphics]::FromImage($im)
foreach($rect in @(@(48,205,492,172),@(170,510,220,105),@(170,680,220,100))) { $r=[System.Drawing.Rectangle]::new($rect[0],$rect[1],$rect[2],$rect[3]); $g.DrawImage($clean,$r,$r,[System.Drawing.GraphicsUnit]::Pixel) }
$fonts=[System.Drawing.Text.PrivateFontCollection]::new(); $fonts.AddFontFile($p+'Montserrat-variable.ttf')
$g.TextRenderingHint=[System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
function DrawText($s,$x,$y,$size,$width,$color) { $font=[System.Drawing.Font]::new($fonts.Families[0],$size,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Pixel); while($g.MeasureString($s,$font).Width -gt $width) { $size--; $font.Dispose(); $font=[System.Drawing.Font]::new($fonts.Families[0],$size,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Pixel) }; $brush=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::$color); $g.DrawString($s,$font,$brush,[single]$x,[single]$y); $font.Dispose(); $brush.Dispose() }
DrawText 'СМЕСИТЕЛЬ' 55 215 65 480 Black
DrawText 'ДЛЯ РАКОВИНЫ' 60 315 43 440 Black
DrawText '10 лет' 177 515 42 215 White
DrawText 'гарантии' 177 560 39 215 White
DrawText 'Премиум' 175 685 39 215 White
DrawText 'качество' 175 730 39 215 White
$g.Dispose(); $im.Save($p+'обложка-11-11-Montserrat.png',[System.Drawing.Imaging.ImageFormat]::Png); $im.Dispose(); $clean.Dispose()
