# Crypto Coders | Solidity Global Variables

کدهای آموزشی متغیرهای سراسری (Global Variables) مربوط به بلاک، تراکنش و پیام در زبان Solidity و بررسی تفاوت عملی `msg.sender` و `tx.origin`.

## ساختار فایل‌های ریپازیتوری

| فایل | نام قرارداد | نسخه کامپایلر | توضیحات |
|---|---|---|---|
| `Globalvariable.sol` | `GlobalVariablesCourse` | `^0.8.0` | شامل ۱۳ تابع آموزشی برای خواندن متغیرهای سراسری `msg`، `tx` و `block` |
| `A.sol` | `A` | `^0.8.0` | بازگرداندن `(msg.sender, tx.origin)` از طریق تابع `getSenderAndOrigin()` |
| `B.sol` | `B` | `^0.8.0` | فراخوانی قرارداد `A` از طریق `callA()` برای نمایش تفاوت فراخواننده مستقیم (`msg.sender`) و آغازگر تراکنش (`tx.origin`) |

## متغیرهای سراسری پوشش‌داده‌شده در `GlobalVariablesCourse`
- **متغیرهای پیام (`msg`):** `msg.sender`، `msg.value`، `msg.data.length` و `msg.sig`
- **متغیرهای تراکنش (`tx`):** `tx.gasprice` و `tx.origin`
- **متغیرهای بلاک و شبکه (`block`):** `block.coinbase`، `block.gaslimit`، `block.number`، `block.timestamp`، `block.prevrandao`، `block.chainid` و تابع `gasleft()`
