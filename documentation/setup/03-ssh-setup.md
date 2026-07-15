# SSH Setup

## Overview

This repository uses separate SSH keys for different types of work:
- **desires** - Personal passion projects (~/grimoire/desires/)
- **pacts** - Professional work, freelance contracts (~/grimoire/pacts/)

## SSH Keys

### Desires Key
- **Email**: guipuszkarek@gmail.com
- **Location**: ~/.ssh/desires
- **Purpose**: Personal projects and custom extensions

### Pacts Key
- **Email**: guilherme.puszkarek@unvoid.com
- **Location**: ~/.ssh/pacts
- **Purpose**: Professional work and freelance contracts

## SSH Config

The `~/.ssh/config` file maps host aliases to the appropriate SSH keys:

```ssh
# Desires - Personal passion projects (~/grimoire/desires/)
Host desires
    HostName github.com
    User git
    IdentityFile ~/.ssh/desires
    IdentitiesOnly yes

# Pacts - Professional work, freelance contracts (~/grimoire/pacts/)
Host pacts
    HostName github.com
    User git
    IdentityFile ~/.ssh/pacts
    IdentitiesOnly yes
```

## Usage

Clone repositories using the host aliases:

```bash
# Clone a desires repository
git clone desires:username/repo.git

# Clone a pacts repository
git clone pacts:username/repo.git
```

## Setup

To regenerate these keys, run:

```bash
# Generate desires key
ssh-keygen -t ed25519 -f ~/.ssh/desires -C "guipuszkarek@gmail.com" -N ""

# Generate pacts key
ssh-keygen -t ed25519 -f ~/.ssh/pacts -C "guilherme.puszkarek@unvoid.com" -N ""
```

Then add the public keys to your GitHub accounts:
- `~/.ssh/desires.pub` → Personal GitHub account
- `~/.ssh/pacts.pub` → Professional GitHub account
