   M S B A M L   `   `   `  ����H  DFragrantWorld, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:FragrantWorldFragrantWorld  5   	       FragrantWorld.OrderWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:FragrantWorld     5   	     � Title$!  Список товаров��5   	   $	��450��6    $	��800��6-    � Icon$ Pictures/icon.ico��69   $��Comic Sans MS)�6R    � WindowStartupLocation$ CenterScreen=�5	   	   .��5
      �� .+�5   
   �  � ColumnDefinitions 5      �� 5      �� 5      $
��Auto �6#   .+�5      �� $��Pictures/logo.png��6   $��21��6/   $
��Left=�6;   $
��5, 0q�6V   �� 5      $&�� ООО Ароматный мир��6   $��30, 3q�61   �� 5      -   5        $��userFullnameTextBlock��5      $��1��65   $��Right=�6E   $��10, 0q�6a   5      �� 5   
   $
��Auto=�6   .��5      �� -   5        $��productsListBox��5      ��5      �� 5      .R�5      �� $��1q�6!   
���   �$��5,0,0,0q�6I    �� Padding$ 3q�6Z   ._�5      �� $	��730��6)    � ContextMenu 5   "   �� 5   &   .@�5   *   m� $��removeOrderMenuItem��63   -   5        $$��Убрать из заказа��5   N   6h   5   '    � 	Resources 5   "    �� 
TargetType �� Property	 �� Value��%\   '��       �� 5    &   " ��6,   .�5!   *   ��  � ��	 6G   �� *Color+5"   '   5#   #   .+�5$   "   �� $
��Bold"�6B   ��6,   �� *Name+6B   �� 5%   "   ��6,   �� *Description+�� 5&   "   ��6,   �� 
 �� StringFormat$%
 Производитель: {0}�� �� Path$ Manufacturer�]� 5'   "   .+�5(   &   �� $��
Цена: ��60   �� 5)   &   $��Strikethrough{�6O   ��60   �� *CostConverter+6O   �� 5*   &   $�� ��60   �� 5+   &   ��60   �� $
 {0:0.00} руб��$ CostWithDiscount��� 5,   &   $��Right=�6j    �� TextAlignment$ Right=�6�   ��60   �� $

 {0}%��$ DiscountAmount�6�   5-   #   5.      5/      50      52      53      �� 54   
   $<��6Выберите пункт выдачи заказа:��6   $��0, 10, 0, 0q�69   �� 55   
   -   5        $"��pickupPointSelectionComboBox��55       �� DisplayMemberPath$ Address��67   $��0, 0, 0, 10q�6S   � 56   
   .+�57      �� $!��Код получения: ��6   $��0,3,3,0q�6/   �� 58      -   5        $��receiptCodeTextBlock��58      $��16(�64   $
��Bold"�6B   59      � 5:   
   .+�5;      �� -   5        $��priceTextBlock��5;      $��Сумма заказа: ��6.   �� 5<      -   5        $��discountTextBlock��5<      $%��Итоговая скидка: ��61   $	��5,0q�6J   5=      ]� 5>   
   .+�5?      �� -   5        $��orderButton��5?      $��Заказать��6(   $��10, 10q�6;   $	��100��6K   $��Right=�6q   �� 5@      -	   5        $��saveTicketButton��5@      $6��0Сохранить талон получения��6-   $	��200��6Q   $��10,10q�6]   $
��Left=�6l   6�   5A      5B      5C      