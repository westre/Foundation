#Project Foundation

Welcome to the project page of Foundation, a FiveM server script. It's currently a simple script consisting of one feature: whitelisting. More features will be added in the near future however, as the goal is to create an administrative system.


##Whitelisting
Given the current limitations of the scripting engine, non-whitelisted players can/will **not** be kicked, but their controls will be disabled and a your message of choice will be shown.

####[Screenshot of the script](http://i.imgur.com/7WqHhFQ.png)

*Disclaimer: it has not been fully tested, the only "real-world test" was a couple of non-whitelisted random players joining and leaving shortly after. Feedback is appreciated.* 

###Installation
- Download the release and extract it in your *resources* folder. The folder *westre-whitelist* should be in the root of *resources*.
- Add westre-whitelist to AutoStartResources in citmp-server.yml
- Chat resource should also be in AutoStartResources as it is required!

###Configuration

**Adding players to the whitelist**
- Open whitelist.txt
- Add the desired username per line

**Changing the message non-whitelisted players see**
- Open html/whitelist.js
- Modify `<span style="color:red;">Access denied.</span> You are not on the whitelist.` to your needs

**Changing the background colour**
- Open html/whitelist.css
- Modify `background-color: rgba(0, 0, 0, 0.9);` to your needs



