#import "VideoTableViewCell.h"
@implementation VideoTableViewCell

@synthesize webView;
@synthesize label1;
@synthesize label2;
//@synthesize VideoTableViewCell;

//==============================================================================
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) 
	{
        // Initialization code
    }
    return self;
}
//==============================================================================
- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//==============================================================================
- (void)dealloc 
{
    [super dealloc];
}
//==============================================================================

@end
