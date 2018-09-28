[original post]( https://forum.nginx.org/read.php?2,236376)

The official guide on setting up PHP as FastCGI on Windows http://wiki.nginx.org/PHPFastCGIOnWindows makes use of batch files. 

A fairly simple guide on setting up PHP as a service on Windows, with full start/stop/restart/status support. 

Usage
---


You can open the Services (win+run>services.msc) and start PHP, or type
 `net start PHP`. 

 - `php-cgi-service start`
 - `php-cgi-service stop`
 - `php-cgi-service status` 
 - `php-cgi-service restart`

Installation
---

### Download winsw.exe

The first thing that's needed is the WinSW binary from https://github.com/kohsuke/winsw/releases
The "winsw-{VERSION}-bin.exe" needs to be saved to the folder containing php-cgi.exe, and needs to be renamed "php-cgi-service.exe" 

### Copy files and create log folder

Copy xml file `php-cgi-service.xml` and `php-cgi-stop.bat` into the same folder as php-cgi.exe and php-cgi-service.exe are.

Create `logs` folder where you want to log the service output.

### Update settings

Fit `C:\PATH\TO` and `PORT`... as needed.

```
<service> 
<id>PHP</id> 
<name>PHP</name> 
<description>PHP</description> 
<executable>C:\PATH\TO\php\php-cgi.exe</executable> 
<stopexecutable>C:\PATH\TO\php\php-cgi-stop.cmd</stopexecutable> 
<env name="PHPRC" value="C:\PATH\TO\FOLDER\CONTAINING\PHPINI" /> 
<logpath>C:\PATH\FOR\WINSW\LOGFILES</logpath> 
<logmode>roll</logmode> 
<startargument>-bPORT</startargument> 
<startargument>-cc:\PATH\TO\php.ini</startargument> 
</service> 
```

### Install windows service

Once this has all been accomplished, open the command prompt, switch to the folder containing php-cgi.exe, and execute the following command: 

```
php-cgi-service install 
```
Testing
---

tested with winsw version 2.1.2

If having issues starting the service, verify it starts on its own by opening the command prompt to the folder containing php-cgi.exe and running: 

```
php-cgi -b(PORT) -cc:\PATH\TO\php.ini 
```

Also, make sure the log folders referenced in the xml file exist.
