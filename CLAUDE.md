# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Rust Commands
- `cargo build` - Compile the project
- `cargo run` - Build and run the application
- `cargo check` - Analyze the code and report errors without building
- `cargo test` - Run all tests
- `cargo clean` - Remove build artifacts from target directory
- `cargo build --release` - Build optimized release version

### CSS/Frontend Commands
- `npm run build-css` - Build CSS with Tailwind CSS from app.css to dist/app.css
- `npm run watch-css` - Watch for changes and rebuild CSS automatically
- `npm install` - Install npm dependencies

## Architecture

This is a Rust project with Tailwind CSS setup and tailwind-fuse integration. The project structure includes:

- `src/main.rs` - Main entry point demonstrating tailwind-fuse usage with type-safe CSS classes
- `app.css` - Input CSS file using Tailwind CSS v4 with custom theme variables
- `dist/app.css` - Generated CSS output from Tailwind CLI
- `Cargo.toml` - Rust project configuration using 2024 edition with tailwind_fuse dependency
- `package.json` - npm configuration for Tailwind CSS CLI and build scripts

### Tailwind Fuse Integration
The project uses `tailwind_fuse` v0.3 with variant features for type-safe CSS class generation:

**Key Features:**
- `tw_join!()` macro for combining CSS classes
- `tw_merge!()` macro for merging classes with conflict resolution
- `#[derive(TwClass)]` for creating component classes with variants
- `#[derive(TwVariant)]` for defining type-safe style variants

**Example Usage:**
```rust
// Basic class operations
let classes = tw_join!("flex", "items-center", "p-4");
let merged = tw_merge!("py-2 px-4", "p-6"); // Resolves conflicts

// Component variants
#[derive(TwClass)]
#[tw(class = "flex items-center rounded-lg")]
struct Button {
    size: ButtonSize,
    color: ButtonColor,
}
```

The integration allows semantic use of Tailwind classes in Rust with compile-time safety and Nord theme integration.

### CSS Setup
The project uses Tailwind CSS v4 with Nord theme color tokens. The source CSS (`app.css`) includes:

**Nord Color Palette:**
- **Polar Night:** `nord0-dark` (#242933), `nord0` (#2e3440), `nord1` (#3b4252), `nord2` (#434c5e), `nord3` (#4c566a)
- **Snow Storm:** `nord4` (#d8dee9), `nord5` (#e5e9f0), `nord6` (#eceff4)  
- **Frost:** `nord7` (#8fbcbb), `nord8` (#88c0d0), `nord9` (#81a1c1), `nord10` (#5e81ac)
- **Aurora:** `nord11` (#bf616a), `nord12` (#d08770), `nord13` (#ebcb8b), `nord14` (#a3be8c), `nord15` (#b48ead)

**Custom Properties:**
- Custom spacing and font variables
- Tailwind CSS imports using `@import "tailwindcss"`

The build process transforms `app.css` into `dist/app.css` with all Tailwind utilities and Nord theme colors properly configured. Colors are available as `nord0-dark`, `nord0` through `nord15` in Tailwind classes.