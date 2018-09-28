[original post]( https://forum.nginx.org/read.php?2,236376)

A fairly simple guide on setting up Nginx as a service on Windows, with full start/stop/restart/status support. 

Usage
---


You can open the Services (win+run>services.msc) and start Nginx, or type
 `net start Nginx`. 

 - `nginx-service start`
 - `nginx-service stop`
 - `nginx-service status` 
 - `nginx-service restart`

Installation
---

### Download winsw.exe

The first thing that's needed is the WinSW binary from https://github.com/kohsuke/winsw/releases
The "winsw-{VERSION}-bin.exe" needs to be saved to the folder containing nginx.exe, and needs to be renamed "nginx-service.exe" 

### Copy files and create log folder

Copy xml file `nginx-service.xml` and `nginx-stop.bat` into the same folder as nginx.exe and nginx-service.exe are.

Create `logs` folder where you want to log the service output.

### Update settings

Fit `C:\PATH\TO` and `PORT`... as needed.

```
<service> 
<id>Nginx</id> 
<name>Nginx</name> 
<description>Nginx</description> 
<executable>C:\PATH\TO\nginx\nginx.exe</executable> 
<stopexecutable>C:\PATH\TO\nginx\nginx-stop.cmd</stopexecutable> 
<logpath>C:\PATH\TO\nginx\logs</logpath> 
<logmode>roll</logmode>
</service> 
```

### Install windows service

Once this has all been accomplished, open the command prompt, switch to the folder containing nginx.exe, and execute the following command: 

```
php-cgi-service install 
```

Testing
---

tested with winsw version 2.1.2

Also, make sure the log folders referenced in the xml file exist.
