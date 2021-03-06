Spectral Partitioning
=====================


1. Introduction: 
----------------

Wind generated ocean waves are almost always present at sea. These waves are
generated by winds somewhere on the ocean, either locally (so called wind-sea)
or thousands of kilometres away (referred to as swell).   

Spectral partitioning attempts to separate the spectrum into distinct wave 
systems such as locally growing wind-seas and swells that have
propagated from elsewhere. This process is not straight forward. Indeed,
agreement about how wind-sea and swell is defined in general can be hard to
reach, with definitions between the modelling community and forecasters often
varying, and a certain amount of subjectivity coming to bear.  

This document outlines some of the issues surrounding wind-sea/swell
partitioning with the WAVEWATCH III model guidance and how this may differ from
guidance available from models such as SWAN and WAM. 


2. Describing the Waves 
-----------------------

Waves are formed when wind blows over the ocean surface.  The size of these
waves is determined by factors such as the strength of the wind, the fetch (the
distance over which the wind blows) and the duration (the time for which it has
been blowing). Young, newly formed waves have short wave-lengths and periods
which grow as the waves propagate away from the point of origin. At any
given location, the waves present will likely be a mix of locally generated
young seas, and swell systems that have been generated elsewhere and have
propagated to that location. The result is a superposition of wave components
of different period, amplitude and direction, as in Figure 1. The speed of
propagation is dependent on the period, with longer period waves propagating
faster than shorter period waves.


.. figure:: images/components.png 
    :width:  150px
    :align: center 
    
    Figure 1. Wave Components

Wind waves are generally described with an energy density spectrum. An example
of such a spectrum in given in Figure 2. On the left, polar direction shows the
direction in which the waves propagate, with frequency indicated by radial
distance from the centre. This example shows a spectrum with two clearly
identifiable peaks, indicating two separate wave systems, the broad wind-sea
peak travelling to the SE and a narrow swell peak travelling to the SW.
Integrating over directions gives the energy density as a function of frequency
only, presented on the right.


.. figure:: images/spec1.png 
    :width: 450px
    :align: center

    Figure 2: Example spectrum, represented as a polar plot showing spectral
    energy density in both frequency and directional space on the left, and
    integrated over direction on the right. 

In addition to the spectral representation above, the wave field can be
described with mean wave parameters. The most commonly used parameter is the
significant wave height (Hs). This wave height is defined as the mean height of
the 1/3 of the highest waves in a sample, and can be computed from the energy
spectrum by: 

.. math:: 

    H_s = 4 \sqrt{E}

where E is the total energy in the wave energy spectrum F , expressed in terms
of the wave frequency f and direction :math:`\theta`

.. math:: 

   E =  \int\int F(f,\theta) df d\theta


3. Partitioning based on wave period (SWAN)
--------------------------------------------

For many forecasting applications, the Hs alone is not enough, and a separation
of the wave height associated with wind-sea and swell individually is required.
There are several ways to compute this with varying degrees of complexity.   As
a simple rule of thumb, it is often stated that any wave component with a
period longer than say 9 seconds is defined as swell, anything with period less
than 9 seconds is wind-sea. This is the method used by the SWAN model.

Inspecting the spectral plot in Figure 2 visually, this approach would seem
reasonable.  Here there are two clear wave systems, that adhere reasonably well
to the above rule of thumb.  However, there are a number of issues with this
approach. Firstly, wind-sea is formally defined as that part of the wave
spectrum that is being forced by the wind. We do not know if the 'wind-sea'
part of the spectrum in Figure 2 is actually being actively forced by the wind
or not, because we have defined this as wind-sea without any information on the
local winds. Secondly, using this approach on a more complex spectrum, such as
the one presented in Figure 3, will create problems. Here, we can visually
identify up to five different wave systems. Assigning all the wave components
with periods greater than 9 seconds to a single swell system becomes
meaningless.  

.. figure:: images/spec2.png 
    :width: 300px
    :align: center

    Figure 3: Example spectrum, showing up to five separate wave systems.


4. Partitioning based on wave period and wind (WAM)
------------------------------------------------------------


Wind-sea/swell partitioning in WAM relies on a reasonably simple relationship
between the wind speed and the wave phase speed (which is a function of wave
period in deep water). In essence, wind-sea is defined as that part of the
spectrum which is actively forced by the wind. The remaining spectrum
defines the swell. 

There are several major limitations to this method of separation.  While it can
be argued that the technique does a reasonable job of separating the wind-sea
component, averaging what remains into a single swell component is clearly
insufficient when the swell component consists of multiple wave systems, as is
usually the case. The resultant output swell will more than likely indicate a
fictitious swell that is the average of multiple systems.  


5. Partitioning based on wave period and wind (WAVEWATCH III)
-------------------------------------------------------------------------

These deficiencies have been addressed in the latest release of WAVEWATCH III,
which now uses a more sophisticated scheme. This is more easily visualised
when the spectrum is plotted as shown in Figure 4.  

.. figure:: images/contour.png 
    :width: 400px 
    :align: center
 
    Figure 4:  Alternative method of plotting  a wave spectrum. See text for
    details.


The implementation used in WAVEWATCH III is based on the work of Hanson &
Jensen (2004), applying the watershed algorithm of Vincent & Soille (1991).
In its original form, this algorithm was used to determine peaks and valleys on
a contour plot, and predict the flow of water as it fell on mountain ranges.
When applied to the inverted wave spectrum, the individual wave systems can be
extracted. A similar approach to that used by WAM in terms of wind speed and
wave phase speed relations is then applied to each wave system to assign a wind
sea/swell fraction. Under this scheme, an arbitrary number of individual wave
systems, or spectral partitions, can be identified. Parameters for each
spectral partition can then be calculated as described in Hanson & Phillips
(2001). 


The technical details of this approach can be found in the references listed
at the end of this document. In practice, the biggest change is that instead
of outputting a single wind-sea and a single swell, as was the case with SWAN
and WAM, WAVEWATCH III finds the wind-sea and all the swell systems that are
present, which is an arbitrary number. The number of swell systems that are
actually output is pre-determined. If there are more swell systems present than
have been defined, then the remaining systems are ignored. This partitioning is
done at every grid point, producing gridded outputs of these fields.    

The process is briefly described below.  

1. Determine partitions (by the process described above). 
2. Determine the wind-sea fraction for each partition (the fraction of the partition that is being
   actively forced). 
3. Combine all partitions with a wind-sea fraction bigger than a set threshold value to give the 
   wind-sea partition.  
4. Rank the remaining partitions by the total energy in each, and assign as primary
   swell, secondary swell, etc.  


While this approach is undoubtedly more physically meaningful, it is a change
from what many users are accustomed to. Some frequently asked questions
are addressed below. Figure 5 shows some example plots of these fields to
which reference is made. 

.. figure:: images/gridded.png 
    :width: 650px
    :align: center 

    Figure 5: Example plots of wind speed (1st row), total hs and tp (2nd row),
    wind-sea hs and tp (3rd row), primary swell hs and tp (4th row) and
    secondary swell hs and tp (5th row).  

Frequently Asked Questions 
--------------------------

**How do the definitions of wind-sea differ between SWAN/WAM and WAVEWATCH
III?**

In both cases, the classification of wind-sea is based on the determination of
what part of the spectrum is being forced by the wind. In SWAN/WAM, this
defines the wind-sea, i.e. everything being forced is wind-sea, the rest is
swell. Relying only on a wind speed dependence in order to define the
separation has the drawback that in the event of a wind change, the
partitioning will change drastically, without any actual change in the wave
field itself.

In WAVEWATCH III, the partitioning is done independently of the wind, as
described above. The wind-sea fraction of each partition is then calculated by
determining what percentage of each partition is being forced. All partitions
that meet a minimum wind-sea fraction are then combined to give the output wind
sea.  

**Why are there gaps in the partitioned grids?**

Wind-sea grids: If no partition satisfies the minimum wind-sea fraction that is
required to be defined as wind-sea, (as discussed above) then no wind-sea will 
be present. In this case, all partitions will appear as a swell.  

Swell grids: For the primary swell, a hole means that all of the energy has
been assigned as wind-sea. This usually occurs under strong winds, when
growing seas dominate the spectrum. For the secondary swell, it means that
there are less than three distinct wave groups present.  

In the example above, this can be readily seen in the case of the strong winds
to the south of Australia. Under the area of maximum winds, a large portion of
the spectrum is being forced, and hence is assigned to wind-sea. Behind the
storm, as the generated waves move away from the storm, they are assigned to
the swell partitions.  

**Why do the wind direction and the wind-sea direction differ?**

Taking the definition of wind-sea as the part of the spectrum that is actively
being forced, how can the direction of the wind-sea and the wind differ? It is
important to consider wind as a vector here. For the waves to be forced, the 
component of the wind travelling in the same direction as the waves must be 
faster than the waves in order to provide input.  Hence, if the wind is strong 
enough, its direction does not have to exactly align with the waves.  

**Which direction is reported?**

Plotted direction is the so-called peak direction, that is, the direction of
the most energetic component of the partition.  

**How can a wind-sea have a period of 12-13 seconds?**

Under strong wind conditions, the wind-sea component can have periods as high
as 12-13 seconds. This seems at odds with the definition given above that
anything over 9 seconds is swell. In reality, this is just a rule of thumb.
Wind-sea is defined as anything that is growing; i.e. anything being forced by
the wind, or receiving energy input. A wave system with period of 12-13
seconds will usually be travelling faster than the wind and so will not be
receiving input. However, if the wind is very strong, a wave system such as
this can still be growing. Hence, it would be designated as wind-sea.  

**Why is there a lack of spatial consistency for the swell fields?**

Looking at the fields above, there appears to be a lack of spatial consistency
for the swell fields. For example, south-west of Australia, it is obvious that
when all the fields are added up, they are consistent with the total Hs,
however, the separation seems haphazard, with little spatial consistency within
the allocations. It is important to realise that the partitioning is done at
each grid point individually, without reference to its neighbours. Hence,
under stronger, one of the partitions is classified as wind sea.  
As waves propagate away from this system, they appear as swell. However,
another swell already exists in the region, as seen in the primary swell, so
this energy appears in the secondary swell. As the wave systems propagate
from grid point to grid point, the local ranking of that wave system may
change, and hence it is reallocated from primary swell to secondary swell, etc.  



**Further Information?**

For more information, contact Tom Durrant or Rafael Guedes
(t.durrant@metocean.co.nz, r.guedes@metocean.co.nz)



References 
----------

Hanson, J L, & Phillips, O. M. (2001). Automated analysis of ocean surface
directional wave spectra. Journal of atmospheric and oceanic technology, 18,
277-293.

Hanson, J.L., & Jensen, R. E. (2004). Wave system diagnostics for numerical
wave models. 8 th International Workshop on Wave Hindcasting and Forecasting,
Oahu, Hawaii, November (p.  231–238).

Vincent, L., & Soille, P. (1991). Watersheds in digital spaces: an efficient
algorithm based on immersion simulations. IEEE Transactions on Pattern Analysis
and Machine Intelligence, 13(6), 583-598. doi: 10.1109/34.87344.

.. _`http://www.bom.gov.au/australia/charts/viewer/index.shtml?domain=combinedw&type=sigwavehgt`:
   http://www.bom.gov.au/australia/charts/viewer/index.shtml?domain=combinedW&type=sigWaveHgt

.. _`t.durrant@bom.gov.au`: mailto:t.durrant@bom.gov.au

