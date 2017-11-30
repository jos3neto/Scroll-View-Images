//
//  ViewController.m
//  Scroll View Images Rev1
//
//  Created by Jose on 28/11/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView* zoomingImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
    //[self setUpZooming];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iPhone paging

-(void) setUpScrollView
{
    CGRect imageViewFrame = self.scrollView.bounds; // the scrollview is the window
    NSArray* imagesArray = @[
                             [UIImage imageNamed:@"black"],
                             [UIImage imageNamed:@"jetblack"],
                             [UIImage imageNamed:@"silver"],
                             [UIImage imageNamed:@"gold"],
                             [UIImage imageNamed:@"rosegold"]
                             ];
    
    self.scrollView.contentSize = CGSizeMake(imageViewFrame.size.width, imageViewFrame.size.height * imagesArray.count);
    self.scrollView.pagingEnabled = YES;
    
    for (UIImage* image in imagesArray) { // this loop fills the contents area with image views
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = imageViewFrame;
        
        [self.scrollView addSubview:imageView];
        
        imageViewFrame = CGRectOffset(imageViewFrame, 0, imageView.frame.size.height);
    }

}

#pragma mark - Airpods Zooming

-(void) setUpZooming
{
    self.zoomingImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"airpods"]];
    //self.zoomingImageView.frame = self.scrollView.bounds;
    
    self.scrollView.delegate = self;
    self.scrollView.contentSize = self.zoomingImageView.image.size;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2;
    
    [self.scrollView addSubview:self.zoomingImageView]; // this fills the whole contents area with one single view
    
}

-(nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.zoomingImageView;
}




@end
