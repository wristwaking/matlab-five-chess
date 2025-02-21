function M_QiPan=Chess(M_QiPan,x_col_Chess,y_row_Chess,radius_Chess,BorW,Wid_edge,Dpixel,Color_QiPanBack,Color_ChessLine)
%此程序下棋或者悔棋
%M_QiPan为棋盘矩阵
%xcol_ChessLine为棋盘列线
%yrow_ChessLine为棋盘行线
%radius_Chess为棋的像素半径
%BorW为下棋选择，1黑棋，2白棋，3悔棋
%Wid_edge为棋盘矩阵中的棋盘边缘的像素宽度
%Dpixel为棋盘矩阵中的相邻棋盘线间的像素间隔
%Color_QiPanBack为棋盘背景颜色
%Color_ChessLine为棋盘线的颜色
Color_BChess=[54,54,54];
Color_WChess=[255,240,245];
[Wid,~,~]=size(M_QiPan);
for i=x_col_Chess-radius_Chess:x_col_Chess+radius_Chess
    for j=y_row_Chess-radius_Chess:y_row_Chess+radius_Chess
        if (i-x_col_Chess)^2+(j-y_row_Chess)^2<=radius_Chess^2
            if BorW==1%黑棋
                M_QiPan(j,i,:)=Color_BChess;
            elseif BorW==2%白棋
                M_QiPan(j,i,:)=Color_WChess;
            elseif BorW==3%悔棋
                M_QiPan(j,i,:)=Color_QiPanBack;
                %对于不是棋盘边缘的棋子
                if i==x_col_Chess||j==y_row_Chess
                    M_QiPan(j,i,:)=Color_ChessLine;
                end
                %悔棋点是否为小圆点
                if ((i-x_col_Chess)^2+(j-y_row_Chess)^2<5^2)&&...
                    (x_col_Chess==Wid_edge+1+Dpixel*3||x_col_Chess==floor(Wid/2)+1||x_col_Chess==Wid-Wid_edge-Dpixel*3)&&...
                    (y_row_Chess==Wid_edge+1+Dpixel*3||y_row_Chess==floor(Wid/2)+1||y_row_Chess==Wid-Wid_edge-Dpixel*3)            
                    M_QiPan(j,i,:)=Color_ChessLine;
                end
                %对于棋盘边缘的棋子
                if x_col_Chess==Wid_edge+1&&i<x_col_Chess
                    M_QiPan(j,i,:)=Color_QiPanBack;
                elseif x_col_Chess==Wid-Wid_edge&&i>x_col_Chess
                    M_QiPan(j,i,:)=Color_QiPanBack;
                end
                if y_row_Chess==Wid_edge+1&&j<y_row_Chess
                    M_QiPan(j,i,:)=Color_QiPanBack;
                elseif y_row_Chess==Wid-Wid_edge&&j>y_row_Chess
                    M_QiPan(j,i,:)=Color_QiPanBack;
                end
            end
        end
    end
end
end