attribute vec4 position;

void main() {
    gl_Position = position; // gl_Position是vertex shader的内建变量，gl_Position中的顶点值最终输出到渲染管线中
}
