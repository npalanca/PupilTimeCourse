# PupilTimeCourse
Scripts to extract pupil sizes from video frames of a pupillary light reflex test. 

1- Choose the video you want to analyze and split it into frames. I use a program named
"Free Video to JPG converter", but there are many options for this.

2- Open Matlab, make sure the current working folder is set to the folder that contains the
scripts: pupdegu, Bordes and Bordesvertical. See image below.

3- Right click on pupdegu in current working folder, select “run” in the menu that pops up.
From step 2: In this picture, arrows indicate current working folder and current path, the working
folder can be switched from the bar that shows the path.

4- Matlab will open a window where you can look for the images. Go to the folder where you
saved the images you extracted from the video and select those corresponding to the part
of the video you want to analyze. It is recommended that you select a fragment of the video
corresponding to a single stimulus and the corresponding post-stimulus period (which
depends on your protocol). See image below.

5- In addition, 15 frames before stimulus onset should be selected, since the program will use
the first 15 frames of your selection to estimate the size of the resting pupil. Please note
that if the video contains blinking the program will no be able to handle it as it is. However,
videos with blinking can still be analyzed by just skipping frames in which the pupil is
obscured when selecting the images to analyze.

6- The program will then open the first image from all the frames you selected, asking you to
select a point within the pupil (the closer to the center, the better). Click on your desired
point, then press Enter. 

7- Then the script asks you for two thresholds, one horizontal, and one vertical. Every pixel
in an image has a "lightness" value, and these thresholds you are going to give it are the
maximum lightness the script should admit. The idea is that the pupil is always going to
be darker than its surroundings, so the script will start looking at pixels up, down, right
and left from the selected point until it finds pixels that are lighter than the threshold.

8- Setting the threshold is the trickiest part. Normally the "lightness" values of pixels within
a pupil will range between 20/40 while its surroundings will be 60-70 or more. However,
this will vary depending on the lighting of your video. For the example attached, a
threshold of 50 is appropriate. However, if you want to get a feel for the lightness values
of your recording you can run "Check_Shade", this script will ask you to open an image
via the file explorer, then you can select a point, press enter and it will give you a vector
with all the lightness values of the pixel at +-300 positions from it in the X axis.

9- Now that it has the starting point and the thresholds, the script will ask you for "strikes".
Strikes are the number of pixels above your threshold the script will accept before
declaring that the edge of the pupil has been found. So, if your strike value is 10, the
script will crawl until it finds 10 CONSECUTIVE pixels above threshold, then stop, go back
10 pixels, and say "this is the edge". In good recordingssuch as the example strike values
can be kept low, 5 or less usually works, but they can be increased in case there are
some lighter objects within the pupil (a reflection, for example) and you need the script
to "skip over" it. For the example, 5 strikes are fine. See image below.

10- Once it has its orders, the script will go through the images you selected finding the
edges of the pupil from your reference point, and recording the vertical and horizontal
diameters of the pupil if the variables were set up appropriately. Once every
approximately 30 frames it will print out one and show you its work, so you can check if
everything is OK. See image below.

11- There are six main output variables, the first three are absolute pixel values.
a. Diametros: Raw pixel value of the horizontal diameter for each of your frames.
b. Diametrosvert: Raw pixel value of the vertical diameter for each of your
frames.
c. Area: For each frame, vertical radius squared times pi.

12- The next three are the equivalent normalized values. The script will take the data for the
first 15 frames and average it to calculate reference values for the pupil size just before
the stimulus. Using this reference, it will output another three variables:
a. Relsize: Relative horizontal pupil size (in %) for each frame.
b. Vertirel: Relative vertical pupil size (in %) for each frame.
c. Arearel: Relative area (in %) for each frame.

13- These variables can be found and looked out in the workspace. They take the shape of
vectors where the corresponding values for each frame are stored consecutively. From
here they can be copied or exported. See image below.

14- The script will plot the complete time course for all the three normalized variables, the
second set described in step 12.
