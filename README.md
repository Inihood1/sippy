
# 🛍️ Shop With Friends – Collaborative Cart Experience of sippy

A Flutter feature that lets two users (a cart creator and a friend) join a shared shopping session, add items to a common cart, and complete together—all simulated with mock data and in-app routing.

---

## 🎯 Objective

- Create a temporary, collaborative cart session  
- Invite a friend via a simulated deep link  
- Both users browse the same list of products and add items, labeled by who added them  
- Friend completes shopping and returns to a neutral home state  

---

## 📁 Project Structure

```
lib/
  models/
    product.dart
    cart_item.dart
    session.dart
  providers/
    product_provider.dart
    session_provider.dart
    cart_provider.dart
  screens/
    home_screen.dart
    cart_invite_screen.dart
    invite_landing_screen.dart
    product_list_screen.dart
    shared_cart_screen.dart
    confirmation_screen.dart
  routes/
    app_router.dart
    app_router.gr.dart
  main.dart
pubspec.yaml
README.md
```

---

## 🚀 Setup Instructions

1. **Clone the repo**  
   ```bash
   git clone https://github.com/inihood1/sippy.git
   cd sippy
   ```

2. **Install dependencies**  
   ```bash
   flutter pub get
   ```

3. **Run the app**  
   ```bash
   flutter run
   ```

---

## 🧱 Architecture & Choices

### Routing
- **auto_route**: Declarative URL-based navigation.  
  - Defined in `app_router.dart` with paths:  
    - `/` → HomeScreen  
    - `/invite` → CartInviteScreen  
    - `/session/:sessionId` → InviteLandingScreen  
    - `/products` → ProductListScreen  
    - `/cart` → SharedCartScreen  
    - `/confirmation` → ConfirmationScreen  

### State Management
- **Provider**:  
  - `SessionProvider`: handles session creation, joining, and clearing.  
  - `ProductProvider`: generates mock products with Faker.  
  - `CartProvider`: manages shared cart items, labeling, total price, and clearing.

### Mock Data
- **faker**:  
  - Generates realistic product names, prices, and unique IDs at runtime.  
  - Ensures each launch shows a fresh catalog without static JSON.

---

## ⚙️ Feature Walkthrough

1. **HomeScreen**  
   - “Start a New Session”: enters your name, creates a session, and navigates to product list.  
   - “Join as Friend”: pastes a fake link (`app://shop/session/xyz123`) to enter the inviter’s context.

2. **CartInviteScreen**  
   - Input name → generates session ID → shows link → copy/send actions.

3. **InviteLandingScreen**  
   - Displays inviter’s name → friend enters their name → joins session → goes to products.

4. **ProductListScreen**  
   - Browse Faker-generated products → tap “Add” to send to shared cart.  
   - FAB shows current cart count, navigates to SharedCartScreen.

5. **SharedCartScreen**  
   - Lists all items with “Added by {name},” shows total price.  
   - “Done Shopping” clears session/cart and pushes ConfirmationScreen.

6. **ConfirmationScreen**  
   - Thank-you message → “Back to Home” returns to root.

---

## ⚠️ Limitations & Assumptions

- **In-Memory Only**: All sessions and carts exist in-memory—no persistence across restarts.  
- **Single Friend**: Only one friend session is supported; multi-party would require extending `Session.participants`.  
- **No Real Deep Linking**: I simulate deep links via manual input/dialog.  
- **No Firebase**: Real-time sync is mocked via `Provider` updates.

---

Thank you for reviewing!.
