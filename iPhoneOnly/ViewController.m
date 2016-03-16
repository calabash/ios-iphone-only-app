#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UIView *cayenne;
@property (weak, nonatomic) IBOutlet UIView *asparagus;
@property (weak, nonatomic) IBOutlet UIView *clover;
@property (weak, nonatomic) IBOutlet UIView *midnight;
@property (weak, nonatomic) IBOutlet UIView *plum;
@property (weak, nonatomic) IBOutlet UIView *tin;
@property (weak, nonatomic) IBOutlet UIView *mocha;
@property (weak, nonatomic) IBOutlet UIView *fern;
@property (weak, nonatomic) IBOutlet UIView *moss;

@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *topMiddleButton;
@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *middleLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomMiddleButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (weak, nonatomic) IBOutlet UIButton *middleRightButton;

- (void) handleTapOnBox:(UIGestureRecognizer *) recognizer;
- (IBAction)smallButtonTouched:(UIButton *)sender;

@end

@implementation ViewController

- (void) viewDidLoad {
  [super viewDidLoad];

  NSArray *views =
  @[
    self.cayenne,
    self.asparagus,
    self.clover,
    self.midnight,
    self.plum,
    self.tin,
    self.mocha,
    self.fern,
    self.moss
    ];


  [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self action:@selector(handleTapOnBox:)];
    recognizer.numberOfTapsRequired = 1;
    [view addGestureRecognizer:recognizer];
  }];
}

- (void) didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL) animated {
  [super viewWillAppear:animated];

  self.actionLabel.text = nil;
}

- (void) handleTapOnBox:(UIGestureRecognizer *) recognizer {
  UIGestureRecognizerState state = recognizer.state;
  if (state == UIGestureRecognizerStateEnded) {
    UIView *view = recognizer.view;
    self.actionLabel.text = view.accessibilityLabel;
  }
}

- (IBAction)smallButtonTouched:(UIButton *)sender {
  NSLog(@"accessibility activation point: %@",
        NSStringFromCGPoint(sender.accessibilityActivationPoint));
  self.actionLabel.text = sender.accessibilityIdentifier;
}

@end
