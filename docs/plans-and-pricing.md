# Plans and Pricing

## The Free Tier

You receive 5k free [packets](/faq/#what-are-packets) every month. This is enough to send data to the cloud every ten minutes for a month. The table below compares different packet spending rates:

|                            | 1 packet per 10 minutes | 1 packet per 5 minutes | 1 packet per minute |
| -------------------------- | ----------------------: | ---------------------: | ------------------: |
| **1 hour**                 |                       6 |                     12 |                  60 |
| **24 hours**               |                     144 |                    288 |               1,440 |
| **1 week**                 |                   1,008 |                  2,016 |              10,080 |
| **1 month**                |                   4,464 |                  8,928 |              44,640 |
| **extra packets required** |                       0 |                  3,928 |              39,640 |

## Purchase Extra Packets

If you need a higher throughput, you can purchase extra packets. These packets are used only when you have no free packets left. To view prices, refer to the [Pricing](https://cloud4rpi.io/home#pricing) page.

The web UI's header displays the number of available packets. You can click it for more information. In the invoked menu, click the **Buy more packets** button to purchase additional packets:

![Buy Packets](/res/managePackets/buy.png)

The same functionality is available in the **Pricing Plan** category of your [account settings](https://cloud4rpi.io/account):

![Account Settings](/res/managePackets/account-settings.png)

## Packet Spending Rate

You can spend packets at any rate. Unspent free and purchased packets are carried over to the next month.

## Send Data When Out of Packets

If you run out of packets, you can still send data at 1 packet per hour.

## Control the Spending Rate

You can specify a personal spending cap to ensure that you never spend too many packets in rapid succession. To do this, go to your [account settings](https://cloud4rpi.io/account) and locate the **Pricing Plan** category. Use the **Packets limit per hour** slider to specify the spending cap.

![Spending Cap](/res/managePackets/spending-cap.png)

The minimum cap is 1 packet an hour&mdash;the maximum is unlimited.

## Set Up Your Device

When you write your device's scripts, make sure to send data to the cloud at a rate based on your budget and requirements.
