# LinuxDotnet

Goals:

1. Create a new MVC Web project from the Visual Studio 2015 wizard on a Windows 10 machine. 
2. Publish to an Ubuntu 14.04 VM on another computer (iMac OSX 10.11.3) in VirtualBox (v5.0.16)
3. Run a script to build, restore and run the website
4. The website is accessable to the original windows machine


Issues (Not all at the same time):

1. Publishing using FTP breaks. "Microsoft.DNX.Publishing.targets(386,5): Error The given path's format is not supported". Using Samba to move files. 
2. Core update 1 rc1 and Core update 1 rc2 can be very different.
3. *.locked.json write access denied issues during dnu restore
4. [Unable to resolve service for type 'IAssemblyLoadContextAccessor'](https://github.com/aspnet/dnx/issues/3032)
5. [The authentication or decryption has failed](https://forums.xamarin.com/discussion/10405/the-authentication-or-decryption-has-failed-in-the-web-request)
6. [dnu restore returns path error ''/.dnx/packages/Microsoft.AspNet.IISPlatformHandler/1.0.0-rc1-final' is denied.'](http://stackoverflow.com/questions/34095014/dnu-restore-returns-path-error-users-account-name-dnx-packages-microsoft-a)



Running an MVC proj on Ubuntu VM that was developed on a Windows PC

1. Install VirtualBox
1. Install Unbuntu 14.04 64-bit PC (AMD64) server install image (8GB virtual hardrive)
1. Name Server: WebServer1
1. Use bridge network connection to share IP with host machine.
1. Install ssh, lamp and samba
1. Install [ASP.NET 5 On Linux](http://docs.asp.net/en/latest/getting-started/installing-on-linux.html#installing-on-ubuntu-14-04)
1. Install [ASP.NET MVC under Linux with Mono](http://r2d2.cc/2014/03/25/asp-net-mvc-under-linux-with-mono/)
1. Configure [Samba](http://www.allaboutlinux.eu/how-to-install-samba-server-on-ubuntu/) for /home/paul/www 
1. Publish VisualStudio project to \\WebServer\www\ 
1. [Install .NET Core for Ubuntu 14.04](http://dotnet.github.io/getting-started/)
1. Restore (dnu restore/dotnet restore)
1. RUn (dnx web)

Alternate: [run this script dotnet.sh](https://github.com/TotzkePaul/LinuxDotnet/blob/master/dotnet.sh)

Extra links:

http://docs.asp.net/en/latest/getting-started/installing-on-linux.html#installing-on-ubuntu-14-04

http://r2d2.cc/2014/03/25/asp-net-mvc-under-linux-with-mono/

https://help.ubuntu.com/community/ModMono

http://www.allaboutlinux.eu/how-to-install-samba-server-on-ubuntu/

http://dotnet.github.io/getting-started/

http://askubuntu.com/questions/640125/how-to-sudo-git-clone-and-safely-change-permission-to-another-user

Saved commands:

dnvm use 1.0.0-rc1-update1 -p -r coreclr

