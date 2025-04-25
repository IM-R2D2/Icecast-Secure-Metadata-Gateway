# 🎧 Icecast Secure Metadata Gateway

A simple, safe, and unsanctioned workaround for when your DevOps team says:  
_"Let’s just expose everything, like in the good old days."_

---

## 🧠 Problem: The Player Doesn't Parse, the DevOps Don’t Care

This project originated from a real-world integration issue:

- A **web/mobile radio player** couldn’t extract metadata from the Icecast-KH stream (due to persistent, unresolved bugs).
- Instead of fixing the player, the DevOps team suggested:
  > _"Can we just use `status-json.xsl` like we used to?"_

Unfortunately, that legacy endpoint exposes everything:
- All **stream mountpoints**, including hidden and testing streams
- **Listener counts** and server identity
- Internals Icecast-KH never intended to be public

Exposing this on the internet?  
Nope. That’s how radio privacy dies — with lazy configuration.

---

## 🔧 Solution: Proxy the Metadata, Not the Problem

So instead of arguing, I built a quiet little workaround.

### 🧭 Key idea:
Extract the one useful thing — **the current track** —  
and expose just that, cleanly and safely, without touching Icecast itself.

---

## 🛠️ How It Works

```text
[BROADCAST SYSTEM] 
     ⬇ generates XML

[SECURE SERVER]
     ⬅ pulls XML via SFTP
     ⬇ watches for updates with inotify
     ⬇ parses + filters data
     ⬇ outputs clean JSON (status-json.xsl)
     ⬆ served via hardened NGINX

[WEB PLAYER]
     ⬅ fetches only what it needs
```
---

``` Sample JSON Output
{
  "icestats": {
    "source": [
      {
        "title": "Sample Title - Sample Artist"
      }
    ]
  }
}
```

❗ Why This Is Public
This is not a tutorial.
This is not a "fun side project."
This is a real production fix that:
Solved a business problem
Respected security principles
Avoided breaking the existing stack
And maybe, just maybe, it'll help someone else avoid shouting into the void during a Friday deploy.



## ❗ About This Code

This repository includes a **demo** version of the metadata-watching script.  
The actual XML parsing logic and event handling is omitted by design.

This is to:
- Prevent careless copy-pasting in production environments
- Avoid misuse without understanding the risks
- Respect the original client and infrastructure context

If you're working on a similar setup and want to collaborate or request the full version, contact the author.

---

📫 Contact: [r2agg.director@gmail.com]  
🔒 License: Closed-source demo (do not redistribute as-is)
