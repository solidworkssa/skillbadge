# 03-skillbadge - Base Native Architecture

> **Built for the Base Superchain & Stacks Bitcoin L2**

This project is architected to be **Base-native**: prioritizing onchain identity, low-latency interactions, and indexer-friendly data structures.

## 🔵 Base Native Features
- **Smart Account Ready**: Compatible with ERC-4337 patterns.
- **Identity Integrated**: Designed to resolve Basenames and store social metadata.
- **Gas Optimized**: Uses custom errors and batched call patterns for L2 efficiency.
- **Indexer Friendly**: Emits rich, indexed events for Subgraph data availability.

## 🟠 Stacks Integration
- **Bitcoin Security**: Leverages Proof-of-Transfer (PoX) via Clarity contracts.
- **Post-Condition Security**: Strict asset movement checks.

---
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
