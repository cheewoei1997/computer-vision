### Segmentation
Edge detection algorithms are what's lit here.

1. [Dilation](../6.%20Segmentation/dilation.m) dilation.m  
    Apparently, dilating an image means make it thicker. Like how your pupils dilate when you see something cute.
2. [Erosion](../6.%20Segmentation/erosion.m) erosion.m  
    Erode the image by removing necessary parts of the image.
3. [Combining Dilation and Erosion](../6.%20Segmentation/erodedilate.m) erodedilate.m  
    Destroying and reconstructing the image using `erode` and `dilate`.
4. [Opening and Closing](../6.%20Segmentation/openclose.m) openclose.m  
    Opening and closing the image using `open` and `close`. You're welcome.
5. [Counting the Number of Rice Grains ](../6.%20Segmentation/countricegrains.m) countricegrains.m  
    Subtracting the background, thresholding the image, then label the objects in the image.
6. [Object Segmentation](../6.%20Segmentation/segmentcells.m) segmentcells.m  
    Outlining the image by dilating the image, smoothen the objects, then subtract the object.