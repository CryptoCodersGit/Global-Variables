// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

/*
 * @title بررسی متغیرهای گلوبال در Solidity
 * @در Solidity، متغیرهای Global متغیرهایی هستند که در کل قرارداد در دسترس‌اند و نیازی به تعریف آن‌ها نداریم، زیرا مستقیماً توسط Solidity ارائه شده‌اند. این متغیرها اطلاعاتی درباره بلاک، تراکنش و محیط اجرای قرارداد را فراهم می‌کنند.
 */

 //Block and Transaction Variables Properties
contract GlobalVariablesCourse {



    /**
     * @notice بازگرداندن آدرس فرستنده تراکنش
     * @return آدرس فرستنده تابع
     */
    function getMsgSender() public view returns (address) {
        // مثال: اگر آدرس کاربری که این تابع را صدا می‌زند 0x1234...abcd باشد، مقدار خروجی همان خواهد بود.
        return msg.sender;
    }
    
    /**
     * @notice بازگرداندن مقدار اتر ارسال شده همراه با تابع
     * @return مقدار Wei ارسال شده
     */
    function getMsgValue() public payable returns (uint) {
        // مثال: اگر کاربر 1 اتر ارسال کند، مقدار خروجی 10**18 Wei خواهد بود.
        return msg.value;
    }
    
    /**
     * @notice دریافت داده‌های خام تراکنش
     * @return بایت‌های داده‌ی خام ورودی
     */
    function getMsgData() public pure returns (bytes memory) {
        // مثال: اگر تابع با مقدار ورودی (42) فراخوانی شود، مقدار data شامل اطلاعات این مقدار خواهد بود.
        return msg.data;
    }
    
    /**
     * @notice دریافت آدرس اصلی که تراکنش را آغاز کرده است
     * @return آدرس اصلی تراکنش (این متغیر امنیت کمتری نسبت به msg.sender دارد)
     */
    function getTxOrigin() public view returns (address) {
        // مثال: اگر تراکنش از طریق قرارداد دیگری ارسال شود، tx.origin همچنان آدرس اصلی ارسال‌کننده را نشان می‌دهد.
        return tx.origin;
    }
    
    /**
     * @notice دریافت زمان ثبت بلاک فعلی
     * @return زمان ثبت بلاک (بر حسب ثانیه - Unix timestamp)
     */
    function getBlockTimestamp() public view returns (uint) {
        // مثال: اگر بلاک در تاریخ 12 مارس 2025 ثبت شده باشد، مقدار خروجی مشابه 1746384000 خواهد بود.
        return block.timestamp;
    }
    function ChangeTime()public view returns(uint){
        return block.timestamp + 1 days + 1 hours + 1 minutes;
    }
    /**
     * @notice دریافت محدودیت گس بلاک فعلی
     * @return محدودیت گس بلاک
     */
    function getBlockGasLimit() public view returns (uint) {
        // مثال: اگر محدودیت گس بلاک 30,000,000 باشد، مقدار خروجی همین مقدار خواهد بود.
        return block.gaslimit;
    }

    /**
     * @notice دریافت شماره بلاک فعلی
     * @return شماره بلاک کنونی
     */
    function getBlockNumber() public view returns (uint) {
        // مثال: اگر شماره بلاک فعلی 20,000,000 باشد، مقدار خروجی نیز 20,000,000 خواهد بود.
        return block.number;
    }


        // block.basefee: هزینه پایه فعلی بلاک.
        // block.chainid: شناسه زنجیره بلاکچین فعلی.
        // block.coinbase: آدرس ماینر یا اعتبارسنج بلاک فعلی.
        // block.difficulty: سختی بلاک (قبل از به‌روزرسانی Paris) یا block.prevrandao پس از آن.
        // block.gaslimit: حداکثر گس که در این بلاک می‌تواند مصرف شود.
        // block.number: شماره بلاک فعلی.
        // block.prevrandao: مقدار تصادفی ارائه شده توسط Beacon Chain.
        // block.timestamp: زمان ایجاد بلاک به ثانیه از Epoch.
        // gasleft(): مقدار گس باقی‌مانده برای اجرای تراکنش.
        // msg.data: داده‌های کامل ارسال‌شده با تراکنش.
        // msg.sender: فرستنده‌ی تراکنش (آخرین قرارداد یا آدرس حساب).
        // msg.sig: اولین ۴ بایت calldata که نشان‌دهنده شناسه تابع است.
        // msg.value: مقدار Wei ارسال‌شده با تراکنش.
        // tx.gasprice: gwei قیمت گس تراکنش. بر واحد 
        // tx.origin: فرستنده‌ی اصلی تراکنش (نه قراردادهای واسطه)
            

            
      struct GlobalVars {
        uint baseFee;
        uint blobBaseFee;
        uint chainId;
        address coinbase;
        uint difficulty;
        uint gasLimit;
        uint blockNum;
        uint prevrandao;
        uint timestamp;
        uint gasLeft;
        bytes data;
        address sender;
        bytes4 sig;
        uint value;
        uint gasPrice;
        address origin;
    }

    function getAllGlobalVars() public payable returns (GlobalVars memory) {
        GlobalVars memory gv= GlobalVars({
            baseFee: block.basefee,
            blobBaseFee: block.blobbasefee,
            chainId: block.chainid,
            coinbase: block.coinbase,
            difficulty: block.difficulty,
            gasLimit: block.gaslimit,
            blockNum: block.number,
            prevrandao: block.prevrandao,
            timestamp: block.timestamp,
            gasLeft: gasleft(),
            data: msg.data,
            sender: msg.sender,
            sig: msg.sig,
            value: msg.value,
            gasPrice: tx.gasprice,
            origin: tx.origin
        });
        return gv;
    }
}
