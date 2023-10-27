# Services

Each sensor is read from a script which is in turn run by a systemd user-service. The service definition files are in the subdirectory systemd-units. To stop/start them you can use the usual systemd commands but with a --user argument. E.g.

* systemctl --user restart data-logger-ads1115.service
* systemctl --user stop data-logger-camera.service

To add a new service:

* systemctl --user enable --now /home/pi/data-logger/systemd-units/data-logger-max31865.service

After this the service should be running.

To check the output of a service, use journalctl:

* journalctl --user-unit data-logger-ads1115.service

possibly with the -f -n 100 option (to continously see output starting with the last 100 lines)

* journalctl --user-unit -f -n 100 data-logger-max31865.service

If you write a new service file, it is recommended that you take a look at an existing one.

The html page is updated by a special service that is called data-logger-update-data-page.service. If you change the script, make sure you restart the service afterwards:

* systemctl --user restart data-logger-update-data-page.service

The sensor services do not run the python scripts directly, but rather a wrapper script which is responsible for piping the python script's output to a file (using tee, so one can inspect the output also in the journalctl log).

The services are configured to run at boot time (see the [Install] section of the unit definitions.)

Florian Paul Schmidt (florian_paul.schmidt@uni-bielefeld.de)
 
