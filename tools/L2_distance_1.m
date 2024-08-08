% 计算平方欧几里德距离
% ||A-B||^2 = ||A||^2 + ||B||^2 - 2*A'*B
function d = L2_distance_1(a,b)
% a,b: 两个矩阵。每一列是一个数据
% d:   a和b的距离矩阵

if (size(a,1) == 1)
  a = [a; zeros(1,size(a,2))];  %将a扩展为 2*size(a,2)
  b = [b; zeros(1,size(b,2))];  %将b扩展为 2*size(b,2)
end

aa=sum(a.*a);   % 1 * size(a,2)
bb=sum(b.*b);   % 1 * size(b,2)
ab=a'*b;        % size(a,2) * size(b,2)
% repmat(aa',[1 size(bb,2)]) 以aa'为整体看成一个元素，创建所有值都是aa'的1 * size(bb,2)矩阵
% size(aa',1) * size(bb,2)  +  size(aa,2) * size(bb,2) - size(aa,2) * size(bb,2)
d = repmat(aa',[1 size(bb,2)]) + repmat(bb,[size(aa,2) 1]) - 2*ab;

d = real(d); % 返回矩阵d中每个元素的实部
d = max(d,0); % d矩阵每个元素和0进行比较，取最大值。即d里面的元素都是大于等于0的

% % force 0 on the diagonal? 
% if (df==1)
%   d = d.*(1-eye(size(d)));
% end
