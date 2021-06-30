

%//##################################//
%//##################################//
%//#@#//                        //#@#// 
%//#@#//  TITLE:  IM_PROCESS    //#@#// 
%//#@#//  AUTHOR: TONY NASR     //#@#// 
%//#@#//                        //#@#// 
%//##################################//
%//##################################//


function [] = im_process() 
  
    clc;
    clear;
    close all;
    pkg load image  
    while (1)
        image_file = inputdlg ("                 Type In The Image FileName To Load:     ", "Choose An Image To Process")
        file       = image_file{1};
        if (exist(file, 'file') == 2)
            break;           
        endif   
        warndlg ("Chosen Image File doesnt Exist") 
    endwhile

    image   = imread(file);
    [x y z] = size(image)
    figure ('Name', 'Original Image');    
    imshow (image)
    
    
    while (1)
        choice = inputdlg ("               Choose An Operation Over The Image: \n\n 1 --> Crop \n 2 --> Resize \n 3 --> Brighten \n 4 --> Make Gray \n 5 --> Invert Colors\n\n", "Choose An Operation To Apply")
        ch     = choice{1};
        ch     = str2num(ch);
        if (ch >= 1 && ch <= 5)
            break;           
        endif   
        warndlg ("Please Choose A Valid Number")          
    endwhile
    
    
    switch (ch)
      case 1
          while (1)
             choice   = inputdlg ("               Choose A Ratio Number To Crop  The Image Based On: ", "Choose An Operation To Apply")
             cho      = choice{1};
             ch       = str2num(cho);
             if (ch > 1 && ch < x && ch < y)
                 break;           
             endif   
             warndlg ("Chosen Ratio Is Not Valid Due To Image Size!")             
          endwhile
          new_image = imcrop (image, [1 1 x/ch y/ch]);
          figure ('Name', 'Modified Image'); 
          imshow (new_image)       
          
      case 2
          while (1)
             choice   = inputdlg ("               Choose A Scale Number (0-1) To Resize The Image Based On: ", "Choose An Operation To Apply")
             cho      = choice{1};
             ch       = str2num(cho);
             if (ch > 0 && ch <1)
                 break;           
             endif   
             warndlg ("Chosen Scale Is Not Valid")             
          endwhile
          new_image = imresize (image, ch);
          figure ('Name', 'Modified Image'); 
          imshow (new_image) 
           
      case 3
          while (1)
             choice   = inputdlg ("               Choose A Brightness Factor To Brighten The Image Based On: ", "Choose An Operation To Apply")
             cho      = choice{1};
             ch       = str2num(cho);
             if (ch > 0)
                 break;           
             endif   
             warndlg ("Chosen Factor Is Not Valid")             
          endwhile
          figure ('Name', 'Modified Image'); 
          imshow (ch*image)           
          
      case 4
          figure ('Name', 'Modified Image'); 
          imshow (rgb2gray(image))

      case 5
          figure ('Name', 'Modified Image'); 
          imshow (255-image)       
          
          
    endswitch  

    
    
    while (1)
         again = inputdlg ("        Again ? (yes/no) ", "Lets Do It Again !!")    
         a     = again{1};
         if (strcmp(a, "yes") == 1)
             close all
             im_process()
         elseif (strcmp(a, "no") == 1)
             close all             
             break;
         endif    
         warndlg ("Must Type in yes OR no only !")
     endwhile

    
endfunction  



