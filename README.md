# alpine-multics
Multics (Multiplexed Information and Computing Service) was a mainframe time sharing operating system begun in 1965

Use https://github.com/RattyDAVE/alpine-multics/issues to send feedback, issues, comments and general chat.

# Part of the retro mini and mainframe series.

* https://hub.docker.com/r/rattydave/alpine-multics - Fully Running Multics mainframe time sharing operating system.
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-tss - Fully running version 3.0 of IBM's Time Sharing System/370
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-vm370 - vm370 Emulator with Robert O'Hara's Six Pack
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-mvs - Fully running MVS 3.8j Tur(n)key 4- System. IBM Mainframe.
* https://hub.docker.com/r/rattydave/alpine-simh/ - AT&T, Data General, DEC PDPs and VAXen, Honeywell, HP and others. All with OSs.
* https://hub.docker.com/r/rattydave/cray1/ - Cray 1 Supercomputer

## Thank you to the following.

* http://multicians.org
* Harry Reed and Charles Anthony

## Usage

```
docker run -d --name multics \
           -p 6180:6180 \
           rattydave/alpine-multics:latest
```

telnet to port 6180 on the docker host.

Or

```
docker run -dit --name multics rattydave/alpine-multics:latest

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' multics
```

Then telnet on port 6180 to the container ip address on port 6180.

```
telnet ipaddress 6180
```

#To Login

In a new shell window, do ```telnet localhost 6180```

Press enter to select the first HSLA port. You should see a login banner.

enter ```login Repair.SysAdmin -cpw```

password is "repair" -- give a new one, twice. you should be logged in.

try some commands, e.g. ```who```

give the ```logout``` command when done.

