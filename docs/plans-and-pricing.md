# Plans and Pricing

## The Free Tier

You receive 10k free packets every month. This is enough to send data to the cloud every five minutes for a month. The table below compares different packet spending rates:

|                            | 1 packet per 5 minutes | 1 packet per minute | 2 packets per minute |
| -------------------------- | ---------------------: | ------------------: | -------------------: |
| **1 hour**                 |                     12 |                  60 |                  120 |
| **24 hours**               |                    288 |               1,440 |                2,880 |
| **1 week**                 |                  2,016 |              10,080 |               20,160 |
| **1 month**                |                  8,928 |              44,640 |               89,280 |
| **extra packets required** |                      0 |              34,640 |               79,280 |

## Purchase Extra Packets

If you need a higher throughput, you can purchase extra packets. These packets are used only when you have no free packets left. To view prices, refer to the [Pricing](https://cloud4rpi.io/home#pricing) page.

The web UI's header displays the number of available packets. You can click it for more information. In the invoked menu, click the **Buy more packets** button to purchase additional packets:

![Buy Packets](/res/managePackets/buy.png)

The same functionality is available in the **Pricing Plan** category of your account settings:

![Account Settings](/res/managePackets/account-settings.png)

## Packet Spending Rate

You can spend packets at any rate. Unspent free and purchased packets are carried over to the next month.

## Send Data When Out of Packets

If you run out of packets, you can still send data at 1 packet per hour.

## Control the Spending Rate

You can specify a personal spending cap to ensure that you never spend too many packets in rapid succession. To do this, go to your [account settings](https://stage.cloud4rpi.io/account) and locate the **Pricing Plan** category. Use the **Packets limit per hour** slider to specify the spending cap.

![Spending Cap](/res/managePackets/spending-cap.png)

The minimum cap is 1 packet an hour - the maximum is unlimited.

## Set Up Your Device

When you write your device's scripts, make sure to send data to the cloud at a rate based on your budget and requirements.
