#!/bin/bash
while true; do
  echo updating...
  page=/tmp/page.html
  finalpage=/home/pi/public_html/index.html

  N_data=2000

  echo '<!DOCTYPE html>' > $page
  echo '<html><head>' >> $page
  echo '<link href="style.css" rel="stylesheet" />' >> $page
  # echo '<meta http-equiv="refresh" content="5">' >> $page
  echo '</head><body>' >> $page

  echo '<img id="stream" src="http://129.70.68.8:8765/stream.mjpg" width="90%">' >> $page
  echo '<script>' >> $page 
  echo '  function refresh() {' >> $page
  echo '    console.log("refresh"); ' >> $page
  echo '    document.getElementById("stream").src = "http://129.70.68.8:8765/stream.mjpg#" + new Date().getTime(); ' >> $page
  echo '    setTimeout(refresh, 5000); ' >> $page
  echo '  } ' >> $page
  echo '  setTimeout(refresh, 5000);' >> $page
  echo '</script>' >> $page

  echo '<div class="content" id="CameraStream">' >> $page
  echo '<section>' >> $page
  echo '<h1>Camera Stream</h1>' >> $page
  echo '<img id="stream" src="http://129.70.68.8:8765/stream.mjpg" width="90%">' >> $page
  echo '</section>' >> $page
            
            
  echo "set terminal png  size 600,400
set xdata time
set xtics rotate by -45
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/ads1115_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/ads1115.txt' using 1:2" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/ads1115_2.png'
plot '< tail -n $N_data /home/pi/data-logger/data/ads1115.txt' using 1:3" | gnuplot
            
  echo '<section id="Temperature">' >> $page
  echo '<h1>Temperature (Sensor: ads1115)</h1>' >> $page
  echo '<img src="ads1115_1.png">' >> $page
  echo '<img src="ads1115_2.png">' >> $page
  echo '</section>' >> $page
        
  echo "set terminal png size 600,400
set xdata time
set xtics rotate by -45
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bme280_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bme280.txt' using 1:2" | gnuplot

  echo "set terminal png size 600,400
set xdata time
set xtics rotate by -45
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bme280_2.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bme280.txt' using 1:3" | gnuplot
        
  echo '<section id="Pressure">' >> $page
  echo '          <h1>Pressure (Sensor: bme280)</h1> ' >> $page
  echo '          <img src="bme280_1.png"> ' >> $page
  echo '    <img src="bme280_2.png"> ' >> $page
  echo '</section>' >> $page       
        
  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/ds18b20_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/ds18b20.txt' using 1:2" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/ds18b20_2.png'
plot '< tail -n $N_data /home/pi/data-logger/data/ds18b20.txt' using 1:3" | gnuplot

  echo '<section id="Volt">' >> $page
  echo '    <h1>Volt (Sensor: ds18b20)</h1>' >> $page 
  echo '    <img src="ds18b20_1.png">' >> $page 
  echo '    <img src="ds18b20_2.png">' >> $page 
  echo '</section>' >> $page
  
  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/xgzp6847d_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/xgzp6847d.txt' using 1:2" | gnuplot

  echo '<section id="Ampere">' >> $page
  echo '    <h1>Ampere (Sensor: xgzp6847d)</h1> ' >> $page
  echo '    <img src="xgzp6847d_1.png"> ' >> $page
  echo '</section>' >> $page
  
  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/mlx90614_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/mlx90614.txt' using 1:2" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/mlx90614_2.png'
plot '< tail -n $N_data /home/pi/data-logger/data/mlx90614.txt' using 1:3" | gnuplot
        
  echo '<section id="Water">' >> $page
  echo '    <h1>Water Temperature (Sensor: mlx90614)</h1>' >> $page
  echo '    <img src="mlx90614_1.png"> ' >> $page
  echo '    <img src="mlx90614_2.png">' >> $page
  echo '</section>     ' >> $page
               
  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/max31865_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/max31865.txt' using 1:2" | gnuplot
       
  echo ' <section id="Infrared">' >> $page
  echo '    <h1>Infrared Temperature (Sensor: max31865)</h1> ' >> $page
  echo '    <img src="max31865_1.png">' >> $page
  echo '</section>' >> $page
  
  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bronkhorst_propar_1.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bronkhorst_propar.txt' using 1:2" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bronkhorst_propar_2.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bronkhorst_propar.txt' using 1:3" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bronkhorst_propar_3.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bronkhorst_propar.txt' using 1:4" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bronkhorst_propar_4.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bronkhorst_propar.txt' using 1:5" | gnuplot

  echo "set terminal png size 600,400
set xtics rotate by -45
set xdata time
set timefmt \"%s\"
set format x \"%H:%M:%S\"
set output '/home/pi/public_html/bronkhorst_propar_5.png'
plot '< tail -n $N_data /home/pi/data-logger/data/bronkhorst_propar.txt' using 1:6" | gnuplot

        
  echo '<section id="Flowmeter">' >> $page
  echo '    <h1>Flow Meter (Sensor: bronkhorst_propar)</h1> ' >> $page
  echo '    <img src="bronkhorst_propar_1.png"> ' >> $page
  echo '    <img src="bronkhorst_propar_2.png"> ' >> $page
  echo '    <img src="bronkhorst_propar_3.png"> ' >> $page
  echo '    <img src="bronkhorst_propar_4.png"> ' >> $page
  echo '    <img src="bronkhorst_propar_5.png"> ' >> $page
  echo '</section>     ' >> $page
  echo '</div>' >> $page
    
  echo '<div class="sidebar">' >> $page
  echo '<ul>' >> $page
  echo '    <a href="#CameraStream">' >> $page
  echo '         <p>Camera Stream</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Temperature">' >> $page
  echo '        <p>Temperature</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Pressure">' >> $page
  echo '        <p>Pressure</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Volt">' >> $page
  echo '        <p>Volt</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Ampere">' >> $page
  echo '        <p>Ampere</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Water">' >> $page
  echo '        <p>Water Temperature</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Infrared">' >> $page
  echo '        <p>Infrared Temperature</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Flowmeter">' >> $page
  echo '        <p>Flowmeter</p>' >> $page
  echo '    </a>' >> $page
  echo '    <a href="#Impressum">' >> $page
  echo '        <p>Impressum</p>' >> $page
  echo '    </a>' >> $page
  echo '</ul>' >> $page
  echo '</div>' >> $page

  echo '<div class="topbar">' >> $page
  echo '<h1>BAPS</h1>' >> $page
  echo '</div>' >> $page

  echo '<div id="Impressum" class="footer">' >> $page
  echo '    <h1>Impressum</h1>' >> $page
  echo '</div>' >> $page

  echo '</body></html>' >> $page
  mv $page $finalpage
  sleep 5
done