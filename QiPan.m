function [M_QiPan, xcol_ChessLine,yrow_ChessLine]=QiPan(NumCell, Dpixel, Wid_edge,Color_QiPanBack,Color_ChessLine)
%此程序为画五子棋盘的程序
%NumCell为棋盘格数
%Dpixel为相邻棋盘线间的像素间隔
%Wid_edge为棋盘边缘的像素宽度
%Color_QiPanBack为棋盘背景颜色
%Color_ChessLine为棋盘线的颜色
%M_QiPan为棋盘矩阵
%xcol_ChessLine为棋盘列线
%yrow_ChessLine为棋盘行线
NumSum=1+Dpixel*NumCell+Wid_edge*2;
xcol_ChessLine=Wid_edge+1:Dpixel:NumSum-Wid_edge;%列
yrow_ChessLine=Wid_edge+1:Dpixel:NumSum-Wid_edge;%行
M_QiPan=uint8(ones(NumSum,NumSum,3));
M_QiPan(:,:,1)=M_QiPan(:,:,1)*Color_QiPanBack(1);
M_QiPan(:,:,2)=M_QiPan(:,:,2)*Color_QiPanBack(2);
M_QiPan(:,:,3)=M_QiPan(:,:,3)*Color_QiPanBack(3);
%画棋盘线
for i=xcol_ChessLine
    M_QiPan(i,Wid_edge+1:NumSum-Wid_edge,:)=ones(NumSum-2*Wid_edge,1)*Color_ChessLine;
end
for j=yrow_ChessLine
    M_QiPan(Wid_edge+1:NumSum-Wid_edge,j,:)=ones(NumSum-2*Wid_edge,1)*Color_ChessLine;
end
%画9个小圆点
radius_Dot=5;
P1=Wid_edge+1+Dpixel*3:Dpixel*(NumCell/2-3):Wid_edge+1+Dpixel*(NumCell-3);
for ti=P1
    for tj=P1
        for Num=ti-radius_Dot:ti+radius_Dot
            for j=tj-radius_Dot:tj+radius_Dot
                if (Num-ti)^2+(j-tj)^2<radius_Dot^2
                    M_QiPan(Num,j,:)=Color_ChessLine;
                end
            end
        end
    end
end
end