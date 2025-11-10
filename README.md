# CV Builder

LaTeX-based CV with automated build workflow.

## Quick Start

Build your CV:
```bash
./build-auto.sh
```

This will automatically use the best available method (Tectonic, XeLaTeX, or Docker).

## Development Workflow

### One-time Build
```bash
./build-auto.sh
```

### Watch Mode (Auto-rebuild on changes)
```bash
# Install fswatch first
brew install fswatch

# Start watch mode
./watch.sh
```

### Edit → View Cycle
1. Edit `cv.tex` in your favorite editor
2. Run `./build-auto.sh`
3. PDF opens automatically
4. Review and iterate

## File Structure

- `cv.tex` - Your CV content
- `soft-cv.cls` - Document class with styling
- `fonts/` - Custom fonts (ModerneSans, SpaceMono)
- `build-auto.sh` - Smart build script
- `watch.sh` - Auto-rebuild on changes

## Customization

Edit `cv.tex` to update:
- Personal information (name, email, etc.)
- Theme color
- Skills
- Work experience
- Projects
- Education

## Build Methods

The build script tries these methods in order:
1. **Tectonic** (recommended) - Fast, self-contained
2. **XeLaTeX** (local) - Full TeX distribution
3. **Docker** - Containerized build

## Installation Options

If no compiler is found:

```bash
# Option 1: Tectonic (recommended)
brew install tectonic

# Option 2: Full MacTeX
brew install --cask mactex-no-gui

# Option 3: Use Docker
# Just start Docker Desktop
```
