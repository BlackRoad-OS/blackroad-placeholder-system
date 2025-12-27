#!/bin/bash

# BlackRoad Placeholder Site Generator
# Usage: ./generate-placeholder.sh <site-name> <title> <description> <emoji>

SITE_NAME=$1
TITLE=$2
DESCRIPTION=$3
EMOJI=$4

if [ -z "$SITE_NAME" ] || [ -z "$TITLE" ] || [ -z "$DESCRIPTION" ]; then
    echo "Usage: ./generate-placeholder.sh <site-name> <title> <description> [emoji]"
    echo "Example: ./generate-placeholder.sh auth-blackroad-io \"Authentication Service\" \"Secure auth for BlackRoad\" \"🔐\""
    exit 1
fi

EMOJI=${EMOJI:-"🚀"}

mkdir -p "../$SITE_NAME"

cat > "../$SITE_NAME/index.html" << 'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SITE_TITLE - BlackRoad OS</title>
    <meta name="description" content="SITE_DESCRIPTION">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --bg: #000000;
            --bg-secondary: #0f0f0f;
            --text: #ffffff;
            --text-muted: #888888;
            --accent-orange: #FF9D00;
            --accent-pink: #FF0066;
            --accent-purple: #7700FF;
            --accent-blue: #0066FF;
            --border: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
            background: var(--bg);
            color: var(--text);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 2rem;
        }

        .container {
            max-width: 600px;
            text-align: center;
        }

        .emoji {
            font-size: 5rem;
            margin-bottom: 2rem;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--accent-orange), var(--accent-pink), var(--accent-purple), var(--accent-blue));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        p {
            font-size: 1.25rem;
            color: var(--text-muted);
            margin-bottom: 3rem;
            line-height: 1.6;
        }

        .status {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: rgba(119, 0, 255, 0.2);
            border: 1px solid var(--accent-purple);
            border-radius: 8px;
            color: var(--accent-purple);
            font-weight: 600;
            margin-bottom: 2rem;
        }

        .notify-form {
            display: flex;
            gap: 1rem;
            max-width: 400px;
            margin: 0 auto 2rem;
        }

        .email-input {
            flex: 1;
            padding: 1rem;
            background: var(--bg-secondary);
            border: 1px solid var(--border);
            border-radius: 8px;
            color: var(--text);
            font-size: 1rem;
        }

        .notify-btn {
            padding: 1rem 2rem;
            background: var(--accent-purple);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .notify-btn:hover {
            background: #8800ff;
            transform: scale(1.05);
        }

        .links {
            display: flex;
            gap: 2rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .link {
            color: var(--accent-blue);
            text-decoration: none;
            transition: color 0.3s;
        }

        .link:hover {
            color: var(--accent-purple);
        }

        .progress-bar {
            max-width: 400px;
            height: 4px;
            background: var(--bg-secondary);
            border-radius: 2px;
            margin: 3rem auto 1rem;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--accent-purple), var(--accent-pink));
            width: 45%;
            animation: progress 2s ease-in-out infinite;
        }

        @keyframes progress {
            0%, 100% { width: 45%; }
            50% { width: 75%; }
        }

        .eta {
            color: var(--text-muted);
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">SITE_EMOJI</div>
        <h1>SITE_TITLE</h1>
        <p>SITE_DESCRIPTION</p>

        <div class="status">🚧 Coming Soon</div>

        <form class="notify-form" onsubmit="notify(event)">
            <input type="email" class="email-input" placeholder="Get notified when we launch" required>
            <button type="submit" class="notify-btn">Notify Me</button>
        </form>

        <div class="progress-bar">
            <div class="progress-fill"></div>
        </div>
        <p class="eta">Currently in development • Launching soon</p>

        <div class="links">
            <a href="https://blackroad.io" class="link">← Back to BlackRoad</a>
            <a href="https://docs.blackroad.io" class="link">Documentation</a>
            <a href="https://status.blackroad.io" class="link">Status</a>
        </div>
    </div>

    <script>
        function notify(event) {
            event.preventDefault();
            const email = event.target.querySelector('input').value;
            alert('✅ Thanks! We\'ll notify ' + email + ' when SITE_TITLE launches!');
            event.target.reset();
        }
    </script>
</body>
</html>
HTMLEOF

# Replace placeholders
sed -i '' "s/SITE_TITLE/$TITLE/g" "../$SITE_NAME/index.html"
sed -i '' "s/SITE_DESCRIPTION/$DESCRIPTION/g" "../$SITE_NAME/index.html"
sed -i '' "s/SITE_EMOJI/$EMOJI/g" "../$SITE_NAME/index.html"

# Create UPGRADES.md
cat > "../$SITE_NAME/UPGRADES.md" << 'UPGRADEEOF'
# SITE_TITLE - Upgrade Path

**[THIS]+[PLACEHOLDER]+[UPGRADES]**

## Current Status
- 🚧 Placeholder deployed
- ✅ Beautiful coming soon page
- ✅ Email notification signup
- ✅ Brand colors and animations

## Priority 1 Features (Core Functionality)
1. [ ] Build main dashboard/interface
2. [ ] Add authentication
3. [ ] Create basic CRUD operations
4. [ ] Add search functionality
5. [ ] Implement filtering

## Priority 2 Features (Enhanced UX)
6. [ ] Add real-time updates
7. [ ] Mobile responsive improvements
8. [ ] Keyboard shortcuts
9. [ ] Dark/light theme toggle
10. [ ] Advanced filtering

## Priority 3 Features (Advanced)
11. [ ] API integration
12. [ ] Webhook support
13. [ ] Export functionality (CSV/PDF)
14. [ ] Batch operations
15. [ ] Custom workflows

## Priority 4 Features (Enterprise)
16. [ ] Team collaboration
17. [ ] Role-based access control
18. [ ] Audit logging
19. [ ] SSO integration
20. [ ] Custom branding

## Future Ideas (Infinite Backlog)
- Analytics dashboard
- AI-powered insights
- Third-party integrations
- Plugin system
- Template marketplace
- Advanced customization
- Multi-workspace support
- Performance optimization
- Accessibility improvements
- Internationalization
- ... infinite more possibilities!

## How to Upgrade

Say any of:
- "next website features for SITE_NAME"
- "upgrade SITE_NAME with feature #3"
- "implement priority 1 for SITE_NAME"
- "add [feature] to SITE_NAME"

All work logged to [MEMORY] with [THIS] tags!
UPGRADEEOF

sed -i '' "s/SITE_TITLE/$TITLE/g" "../$SITE_NAME/UPGRADES.md"
sed -i '' "s/SITE_NAME/$SITE_NAME/g" "../$SITE_NAME/UPGRADES.md"

echo "✅ Created placeholder for $SITE_NAME"
echo "📁 Location: ../$SITE_NAME/"
echo "📄 Files: index.html, UPGRADES.md"
echo ""
echo "🚀 Next steps:"
echo "   1. cd ../$SITE_NAME"
echo "   2. git init && git add . && git commit -m \"[THIS]+[PLACEHOLDER] $TITLE\""
echo "   3. gh repo create BlackRoad-OS/$SITE_NAME --public --source=. --remote=origin --push"
echo ""
