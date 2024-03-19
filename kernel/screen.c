#include "screen.h"
#include "utils.h"

void screen(){
  // char* video_memory = (char*) VIDEO_ADDRESS;
  // *video_memory = 'X';
  //
  // wait(2);
  // *video_memory = 'Y';
  clear_screen();

}

void clear_screen(void){
  char* video_memory = (char*) VIDEO_ADDRESS;
  for(int i = 0; i < (80 * 25); i ++){
    *(video_memory+(i*2)) = '\0';
  };
}

void printf(void){
  // to do
}
