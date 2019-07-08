# Manage Packets

## The Free Tier

You receive 10k free packets every month. This amount is sufficient to send data to the cloud every five minutes for the whole month. The table below compares different spending rates.

|                            | 1 packet per 5 minutes | 1 packet per minute | 2 packets per minute |
| -------------------------- | ---------------------: | ------------------: | -------------------: |
| **1 hour**                 |                     12 |                  60 |                  120 |
| **24 hours**               |                    288 |               1,440 |                2,880 |
| **1 week**                 |                  2,016 |              10,080 |               20,160 |
| **1 month**                |                  8,928 |              44,640 |               89,280 |
| **extra packets required** |                      0 |              34,640 |               79,280 |

## Purchase Extra Packets

If you need a higher throughput, you can purchase extra packets. These packets are used only when you have no free packets left. To view prices, refer to the [Pricing](https://cloud4rpi.io/home#pricing) page.

The web UI's header displays the amount of packets available to you. Click it to view detailed information. In the invoked menu, click the **Buy more packets** button to purchase additional packets:

![Buy Packets](/res/managePackets/buy.png)

The same functionality is available in the **Pricing Plan** category of your account settings:

![Account Settings](/res/managePackets/account-settings.png)

## Packet Spending Rate

You are free to spend packets at any rate. The packets that you did not spend in the current month are carried over to the next month. This applies to both free and purchased packets.

## Send Data When Out of Packets

If you are out of packets in the current month, you can still send data at limited rate - 1 packet an hour.

## Control the Spending Rate

You can specify a personal spending cap to ensure that you never spend too many packets in rapid succession. To achieve this, go to your [account settings](https://stage.cloud4rpi.io/account) and locate the **Pricing Plan** category. Use the **Packets limit per hour** slider to specify the spending cap.

![Spending Cap](/res/managePackets/spending-cap.png)

The minimum cap is 1 packet an hour, the maximum is unlimited.

## Set Up Your Device

When you write your device's scripts, make sure to send data to the cloud at a rate that both fits your budget and satisfies your project's requirements.
