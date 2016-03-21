title: Spectral partition
units: m^2s/degree
description: Part of the overall wave spectrum that represents a particular wave train such as sea or swell.

#Spectral partition
While the [wave spectrum](wave-spectrum) formally consists of multiple individual wave components with unique frequency and direction, there are normally one or more coherent partitions. Examples are the local [sea](sea) or a remotely generated [swell](swell) that come from different origins but can coexist within the local sea state.

In order to divide the complete wave spectrum into its partitions one of two methods is used:
1. Splitting the spectrum at a specific frequency, typically between 8 and 10 seconds. This reflects the fact that swell typically longer period than locally generated sea. However in the case where a short period swell coincides with a well developed sea, this method may struggle to differentiate between the two partitions.
2. A spectral water shed method, which attempts to isolate discrete peaks or lumps within the overall wave spectrum. As sea and swell often have their maximum energy centred at different periods and directions, this provides a good separation, and does not assume any particular period. An additional advantage is that more than two partitions can be extracted, therefore potentially isolating multiple swells from different remote origins. The main disadvantage is that to label a partition as sea still requires a physical definition, such as relative windspeed. The binary switching of a partiton from sea to swell as it crosses the physical threshold can lead to sudden jumps in the spectral parameters associated with each partition, which may be confusing to some end users. 

For each partition, a separate set of [spectral parameters](spectral-parameters) can be calculated. 
