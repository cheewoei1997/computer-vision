# Computer Vision
A repository on the adventures of Madam Tee Connie's computer vision class using Matlab as her medium of knowledge dissemination.

In this repository all tutorials from laboratory 1 through laboratory [pending] will be covered and listed as numbers as such:

### Basics
The very basics of Matlab to get you started real quick.

1. [Simple Scalar Operations](../1.%20Basics/simplescalaroperations.m) simplescalaroperations.m
2. [Creating a Vector/Matrix](../1.%20Basics/createvectormatrix.m) createvectormatrix.m
3. [Indexing](../1.%20Basics/indexing.m) indexing.m
4. [Matrix Operators](../1.%20Basics/matrixoperators.m) matrixoperators.m
5. [for/while Loops](../1.%20Basics/loops.m) loops.m
6. [Functions vs. Scripts](../1.%20Basics/functionsvsscripts.m) functionsvsscripts.m
7. [Plotting](../1.%20Basics/plotting.m) plotting.m
8. [Images](../1.%20Basics/images.m) images.m

### Sampling, Quantization, Resolution
Playing with images using pixels, colours, and filters.

1. [Sampling](../2.%20Sampling,%20Quantization,%20Resolution/sampling.m) sampling.m  
    The play of pixels on an image to resize them. This effect will usually cause the checkboard effect.
2. [Quantization](../2.%20Sampling,%20Quantization,%20Resolution/quantization.m) quantization.m  
    Manipulation on the number of gray levels on an image to simplify the image.
3. [Resolution](../2.%20Sampling,%20Quantization,%20Resolution/resolution.m) resolution.m  
    The use of filters with values of ones to demonstrate gaussian blurring.

### Smoothening and Histogram Manipulation
We play with contrast stretching and median filter in this lab.

1. [Contrast Stretching and Histogram Equalization](../3.%20Smoothening%20and%20Histogram%20Manipulation/contraststretchhistoequal.m) contraststretchhistoequal.m  
    Contrast stretching vs. histogram equalization.
2. [Quantization](../3.%20Smoothening%20and%20Histogram%20Manipulation/convoandmedianfilter.m) convoandmedianfilter.m  
    Convolutional filters seem to not be as good as median filters in noise cleanup.
3. [Resolution](../3.%20Smoothening%20and%20Histogram%20Manipulation/difference.m) difference.m  
    Subtracting the background of an image to obtain the region of interest.

### Noise
Experimenting with different types of noise and how to handle them.

1. [Implementing Noise Model](../4.%20Noise/addnoise.m) addnoise.m  
    Simulate noise in your image by adding them because who even likes clear images.
2. [Noise Reduction](../4.%20Noise/reducenoise.m) reducenoise.m  
    Adding noise and removing them from the original image.
3. [Simulating a Motion Blur Effect](../4.%20Noise/motionblur.m) motionblur.m  
    Simulate a motion blur then use Wiener filter to deblur the image.

### Edge Detection
Edge detection algorithms are what's lit here.

1. [Implementing Edge Detector](../5.%20Edge%20Detection/edgedetectors.m) edgedetectors.m  
    Edge detecting with Sobel, Prewitt, Roberts, and Canny.
2. [Sobel Edge Detector](../5.%20Edge%20Detection/sobeledgedetector.m) sobeledgedetector.m  
    Detecting vertical, horizontal, +45 degree and -45 degree edges with Sobel.
3. [The Laplacian Operator](../5.%20Edge%20Detection/laplacian.m) laplacian.m  
    Using the laplacian operator to sharpen the image by subtracting.

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

### Thresholding
Turning them all black and white cuz who likes colours anyway.

1. [Simple Thresholding](../7.%20Thresholding/simplethresh.m) simplethresh.m  
    Automatic thresholding that's done by the computer.
2. [Adaptive Thresholding](../6.%20Thresholding/adaptivethresh.m) adaptivethresh.m  
    Separate the image into blocks and find the threshold for that specific block.
3. **[Incomplete]** [Incorporating Filter Technique in Thresholding](../6.%20Thresholding/filterthresh.m) filterthresh.m  
    Utilise filters on top of thresholding to achieve better results.

### Gray-Level Co-Occurrence Matrices
1. [Creating GLCM from Image and Analyzing its Properties](../8.%20Gray-Level%20Co-Occurrence%20Matrices/glcm.m) glcm.m  
    Finding out the GLCM of a cropped area in the specified image.