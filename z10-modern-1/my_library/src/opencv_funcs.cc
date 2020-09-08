//
// Created by Hedzr Yeh on 2020/9/8.
//

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <string>

using namespace cv;
using namespace std;

int opencv_main(int argc, char **argv) {
    String imageName("../dog.jpg"); // by default
    if (argc > 1) {
        imageName = argv[1];
    }
    Mat image;
    image = imread(imageName, IMREAD_COLOR); // Read the file
    if (image.empty())                       // Check for invalid input
    {
        cout << "Could not open or find the image" << std::endl;
        return -1;
    }
    namedWindow("Display window", WINDOW_AUTOSIZE); // Create a window for display.
    imshow("Display window", image);                // Show our image inside it.
    waitKey(0); // Wait for a keystroke in the window
    return 0;
}