# Virtual-World-Auto-Reset-System-for-VORP

1️⃣ Reset Virtual World (VW) on connection
Checks which VW the player is in when they connect and automatically resets them to VW 0 if necessary.

2️⃣ Periodic player verification
Every 30 seconds, it checks all players on the server.
If any player is in a VW other than 0, it moves them back to VW 0.

3️⃣ Command to check Virtual World (/vw)
Players can use the /vw command to see which VW they are in.
A message is displayed in chat, and a debug message appears in the console.

4️⃣ Reset Virtual World after respawn
After a player respawns, the script checks them and moves them back to VW 0 if necessary.

5️⃣ Debugging for administrators
Displays debug messages in the console to monitor and track players' Virtual World status.

🔹 Main goal of this script: Ensures that no player remains stuck in a Virtual World and that everyone is in VW 0, preventing bugs and instancing issues. 🚀

I couldn't find such a script on the internet so I'm posting my own script here!
