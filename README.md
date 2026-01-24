# SkillBadge

Achievement NFT minter with soulbound tokens on Base and Stacks.

## Features

- Mint non-transferable achievement badges
- Store skill metadata
- Track badge collections
- Soulbound (non-transferable) enforcement

## Contract Functions

### Base (Solidity)
- `mintBadge(recipient, skill, metadata)` - Mint new badge
- `getBadge(badgeId)` - Get badge details
- `getUserBadges(address)` - Get user's badges

### Stacks (Clarity)
- `mint-badge` - Mint achievement badge
- `get-badge` - Fetch badge info
- `get-user-badge` - Get user badge by index

## Quick Start

```bash
pnpm install
pnpm dev
```

## Deploy

```bash
pnpm deploy:base
pnpm deploy:stacks
```

## License

MIT
