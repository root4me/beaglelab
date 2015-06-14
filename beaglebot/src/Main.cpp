/*
 * Main.cpp
 *
 *  Created on: Jun 13, 2015
 *      Author: harish
 */

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

#include "shapes.h"

using namespace std;
using namespace cv; //opencv namespace

//declared extern in shapes.h
bool verbose = false;
int camera = -1;
string fileName;

Mat input;

void processfile()
{
	input = imread(fileName);

	if (input.empty()) {
		cout << "-> file not found ! -> " << fileName << endl;
	}

	shapes s = shapes(input);
	std::vector<arrow> arrows = s.arrows();

	for (uint i = 0 ; i < arrows.size(); i++)
	{
		cout << "points - > " << arrows[i].polygon << endl;
		cout << "direction -> " << arrows[i].direction << endl;

	}

	waitKey(0);

	input.deallocate();

}

void printusage()
{
	cout << "usage : beaglebot [-v] [-c <camera number>] [-i <input image file>" << endl;
	cout << "\t-v	Display verbose output. Used to output debug values to console" << endl;
	cout << "\t-c	Specify camera 0 or 1. If there is only one cam it is usually 0. Any additional USB cams will have higher numbers" << endl;
	cout << "\t-i	Input image file. Test shape recognition using image file as input" << endl;
}

void printstartparams()
{
	cout << "----------------------------" << endl;
	cout << "Image file : " << fileName << endl;
	cout << "Camera : " << camera << endl;
	cout << "Verbose : " << verbose << endl;
	cout << "----------------------------" << endl;
}

int main(int argc, char **argv) {

	int option;
	char *cam;

	if (argc ==1 ) printusage();

	while ((option = getopt (argc, argv, "c:i:v")) != -1)
	{
		switch (option)
		{
		case 'c':
			cam = optarg;
			camera = atoi(cam); // convert to integer
			cout << "capture from camera " << camera << endl;
			break;
		case 'i':
			fileName = optarg;
			break;
		case 'v':
			verbose = true;
			break;
		default:
			printusage();
			return 1;

		}
	}

	printstartparams();

	if (!(fileName.empty()))
	{
		// process file
		processfile();
	}
	else if (camera != -1)
	{
		//process from camera
	}

	return 0;

}



