# Blue Eagles HR Theme Customization

This document describes the custom theme changes applied to transform OrangeHRM into Blue Eagles HR.

## 🎨 Color Scheme

### Primary Colors
- **Primary Color**: `#004eaa` (Deep Blue)
- **Secondary Color**: `#004eaa` (Deep Blue)
- **Primary Font Color**: `#FFFFFF` (White - retained)
- **Secondary Font Color**: `#FFFFFF` (White - retained)

### Gradient Colors
- **Primary Gradient Color 1**: `#004eaa` (Deep Blue)
- **Primary Gradient Color 2**: `#009DFF` (Light Blue)

## 🔧 Files Modified

### Core Theme Configuration
1. **`src/plugins/orangehrmSystemCheckPlugin/Controller/SystemCheckController.php`**
   - Updated default theme variables
   - Changed from orange (#FF7B1D) to blue (#004eaa)

2. **`installer/Migration/V5_1_0/Migration.php`**
   - Updated default theme JSON configuration
   - Applied blue color scheme to migration data

### API Documentation
3. **`src/plugins/orangehrmCorporateBrandingPlugin/Api/Model/ThemeModel.php`**
   - Updated API documentation examples
   - Changed color examples from orange to blue

4. **`src/plugins/orangehrmCorporateBrandingPlugin/Api/ThemeAPI.php`**
   - Updated API request/response examples
   - Applied blue color scheme to documentation

5. **`src/plugins/orangehrmCorporateBrandingPlugin/Api/PreviewThemeAPI.php`**
   - Updated preview API documentation
   - Changed gradient examples to blue colors

### Testing
6. **`src/plugins/orangehrmCorporateBrandingPlugin/test/Service/ThemeServiceTest.php`**
   - Updated test expectations
   - Changed test color values to match new theme

### Branding
7. **`src/plugins/orangehrmCorePlugin/templates/base.html.twig`**
   - Updated page title to "Blue Eagles HR"
   - Added custom favicon reference

8. **`src/client/public/index.html`**
   - Updated client-side title and favicon
   - Applied Blue Eagles HR branding

9. **`installer/client/public/index.html`**
   - Updated installer favicon
   - Applied consistent branding

10. **`src/plugins/orangehrmCorePlugin/templates/copyright.html.twig`**
     - Updated footer copyright to "Blue Eagles"
     - Changed company link from OrangeHRM to Blue Eagles

11. **`installer/config/templates/copyright.html.twig`**
     - Updated installer footer copyright to "Blue Eagles"
     - Applied consistent branding across installer

12. **`src/client/src/orangehrmAuthenticationPlugin/pages/Login.vue`**
     - Removed social media links (LinkedIn, Facebook, Twitter, YouTube)
     - Removed social media authentication component
     - Cleaned up login page footer

13. **`installer/client/src/components/InstallerLayout.vue`**
     - Removed OrangeHRM installation guide link

14. **`installer/client/src/pages/InstallScreen.vue` & `UpgradeScreen.vue`**
     - Removed OrangeHRM FAQ links
     - Disabled external help references

15. **`src/client/src/core/components/layout/Layout.vue`**
     - Removed upgrade button from top bar
     - Disabled upgrade functionality
     - Removed external OrangeHRM upgrade link

## 🚀 Application Scripts

### Quick Setup
```bash
# Apply complete Blue Eagles HR theme
chmod +x apply-blue-theme.sh
./apply-blue-theme.sh
```

### Manual Steps
```bash
# 1. Copy favicon
mkdir -p src/client/public installer/client/public
cp web/images/no-text.png src/client/public/
cp web/images/no-text.png installer/client/public/

# 2. Rebuild containers
docker-compose down
docker-compose up -d --build
```

## 🎯 Visual Changes

### What You'll See
- **Login Page**: Blue gradient background instead of orange
- **Navigation**: Blue primary buttons and links
- **Headers**: Blue accent colors throughout
- **Buttons**: Blue primary action buttons
- **Branding**: "Blue Eagles HR" title and favicon
- **Gradients**: Smooth blue gradient effects
- **Footer**: "Blue Eagles" copyright instead of "OrangeHRM, Inc"
- **Clean Login**: No social media links or external references
- **No External Links**: All OrangeHRM.com references removed
- **Clean Top Bar**: No upgrade button or promotional elements

### Browser Tab
- **Title**: "Blue Eagles HR"
- **Favicon**: Custom no-text.png icon

## 🔄 Theme Persistence

The theme changes are applied at the application level and will:
- ✅ Persist across container restarts
- ✅ Apply to new installations
- ✅ Override default OrangeHRM colors
- ✅ Work with all OrangeHRM modules

## 🛠️ Customization

### To Modify Colors
Edit the following files with your desired hex colors:
- `src/plugins/orangehrmSystemCheckPlugin/Controller/SystemCheckController.php`
- `installer/Migration/V5_1_0/Migration.php`

### To Change Branding
- Update `Config.php` for product name
- Replace `no-text.png` for new favicon
- Modify HTML templates for title changes

## 📝 Notes

- Font colors are retained as white (#FFFFFF) for optimal contrast
- All gradient effects use the blue color scheme
- Theme changes apply immediately after container rebuild
- Browser cache may need clearing to see changes
- Custom theme persists in database after installation
