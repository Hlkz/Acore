#ifndef MODEL_H
#define MODEL_H

#include "loadlib/loadlib.h"
#include "vec3d.h"
//#include "mpq.h"
#include "modelheaders.h"
#include <vector>

class Model;
class WMOInstance;
class MPQFile;

Vec3D fixCoordSystem(Vec3D v);

class Model
{
private:
    std::string filename;
public:
    ModelHeader header;
    uint32 offsBB_vertices, offsBB_indices;
    Vec3D *BB_vertices, *vertices;
    uint16 *BB_indices, *indices;
    size_t nIndices;

    bool open();
    bool ConvertToVMAPModel(char * outfilename);

    bool ok;

    Model(std::string &filename);
    ~Model();
    char outfilename;
};

class ModelInstance
{
public:
    uint32 id;
    Vec3D pos, rot;
    uint16 scale, flags;
    float sc;

    ModelInstance() : id(0), scale(0), flags(0), sc(0.0f) {}
    ModelInstance(MPQFile &f,const char* ModelInstName, uint32 mapID, uint32 tileX, uint32 tileY, FILE *pDirfile);

};

#endif
