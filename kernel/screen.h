#define VIDEO_ADDRESS   0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80
// Byte for default color scheme
#define WHITE_ON_BLACK 0x0f
// Screen device I/O ports
#define REG_SCREEN_CTRL 0x3D4
#define REG_SCREEN_DATA 0X3D5

void screen(void);
void clear_screen(void);
