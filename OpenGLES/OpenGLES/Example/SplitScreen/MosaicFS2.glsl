
precision highp float;
uniform sampler2D u_colorMap;
varying vec2 v_texture;

const float mosaicSize = 0.02;

void main() {
    float length = mosaicSize;
    float TR = 0.866025;
    
    float x = v_texture.x;
    float y = v_texture.y;
    
    int wx = int(x / 1.5 / length);
    int wy = int(y / TR / length);
    vec2 v1, v2, vn;
    
    if (wx/2 * 2 == wx)
    {
        if (wy/2 * 2 == wy)
        {
            v1 = vec2(length * 1.5 * float(wx), length * TR * float(wy));
            v2 = vec2(length * 1.5 * float(wx + 1), length * TR * float(wy + 1));
        }
        else
        {
            v1 = vec2(length * 1.5 * float(wx), length * TR * float(wy + 1));
            v2 = vec2(length * 1.5 * float(wx + 1), length * TR * float(wy));
        }
    }
    else
    {
        if (wy/2 * 2 == wy)
        {
            v1 = vec2(length * 1.5 * float(wx), length * TR * float(wy + 1));
            v2 = vec2(length * 1.5 * float(wx + 1), length * TR * float(wy));
        }
        else
        {
            v1 = vec2(length * 1.5 * float(wx), length * TR * float(wy));
            v2 = vec2(length * 1.5 * float(wx + 1), length * TR * float(wy + 1));
        }
    }
    
    float s1 = sqrt(pow(v1.x - x, 2.0) + pow(v1.y - y, 2.0));
    float s2 = sqrt(pow(v2.x - x, 2.0) + pow(v2.y - y, 2.0));
    if (s1 < s2)
    {
        vn = v1;
    }
    else
    {
        vn = v2;
    }
    
    gl_FragColor = texture2D(u_colorMap, vn);
}
