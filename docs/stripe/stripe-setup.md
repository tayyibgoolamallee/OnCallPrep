# Stripe Setup (MVP-friendly)

## Do you need an LLC or business bank?
- Not required to start. Stripe supports individuals/sole proprietors with a personal bank account.
- A dedicated business account is recommended for bookkeeping but is optional at activation.
- You can start as an individual and update later if you incorporate.

## Quick MVP path (Payment Links)
1) Create Stripe account, activate payments.
2) Add your bank account (personal is acceptable to start).
3) Create a Product + Price.
4) Create a Payment Link.
5) Put the Payment Link on your pricing page/CTA buttons.

## When to consider LLC/business account
- Liability separation and cleaner tax footprint.
- If taking on partners/employees or higher volumes.
- You can defer until you validate revenue.

## Later: Checkout / Customer Portal
- Use Stripe Checkout for hosted payment pages.
- Use Customer Portal for self-serve subscription management.

## Notes
- Keep keys out of the frontend. For Payment Links, no key is exposed.
- If you move to Checkout/Portal, store secrets in environment variables (Vercel).

