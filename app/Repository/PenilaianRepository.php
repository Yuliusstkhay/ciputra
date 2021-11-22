<?php
namespace App\Repository;

use App\Models\PenilaianHeader;
use App\Models\PenilaianDosenMahasiswaDetail;
use App\Models\PenilaianAssessment;
use App\Models\PenilaianDosenMahasiswa;
use App\Models\PenilaianAssessmentDetail;
use App\Models\PenilaianAssessmentNilai;
use Auth;
use Illuminate\Http\Request;

class PenilaianRepository{
    
    public function getListPenilaian(){
        $data = PenilaianHeader::where('status',1)->where('status_transaksi',0)->with(['jadwal','jadwal.dosenmahasiswa','jadwal.matakuliah']);
        if(Auth::user()->type == 0){
            $data->whereHas('jadwal',function($q){
                $q->where('dosen_mahasiswa_id',Auth::user()->dosen->id);
            });
        }
        return $data->get();
    }
    
    public function insert(){
        $penilaian = new PenilaianHeader();
        return $penilaian;
    }
    
    public function insertDosen(){
        $penilaian = new PenilaianDosenMahasiswaDetail();
        return $penilaian;
    }
    
    public function insertMahasiswa(){
        $data = new PenilaianDosenMahasiswa(); 
        return $data;
    }
    
    public function show($id){
        $data = PenilaianHeader::find($id);
        return $data;
    }
    
    public function penilaianAssessmentReport($id,Request $request){
        $data = PenilaianAssessment::where('penilaian_id',$id)->whereHas('assessment',function($q) use ($request){
            $q->where('assessment_name','like',"%".$request->q."%");
        })->get();
        return $data;
    }
    
    public function insertAssessment(){
        return new PenilaianAssessment();
    }
    
    public function insertAssessmentDetail(){
        return new PenilaianAssessmentDetail();
    }
    
    public function showAssessmentDetail($penilaian_assessment,$dosen){
        return PenilaianAssessmentDetail::where('penilaian_assessment_id',$penilaian_assessment)->where('dosen_mahasiswa_id',$dosen);
    }
    
    public function showPenilaianAssessment($penilaian,$assessment){
       $data = PenilaianAssessment::where('penilaian_id',$penilaian)->where('assessment_id',$assessment)->first(); 
       return $data;
    }
    

    
    
    public function getPenilaianDosen($id){
        $data = PenilaianDosenMahasiswaDetail::where('penilaian_id',$id)->with(['dosen','dosen.programstudi']);
        return $data;
    }
    
    public function checkPenilaianDosen($id,$dosen){
        $data = PenilaianDosenMahasiswaDetail::where('penilaian_id',$id)->where('dosen_mahasiswa_id',$dosen)->count();
        return $data;
    }
    
    public function checkPenilaianAssessment($id,$assessment_id){
        $data = PenilaianAssessment::where('penilaian_id',$id)->where('assessment_id',$assessment_id)->count();
        return $data;
    }
    
    public function getKriteriaPenilaian($id,$assessment_id){
      $data = PenilaianAssessment::where('penilaian_id',$id)->where('assessment_id',$assessment_id)->first();
      if(!is_null($data)){
        return $data->kriteria_penilaian;  
      }else{
          return "";
      }
    }
    
    public function getPenilaianDosenMahasiswa($id){
        $data = PenilaianDosenMahasiswa::where('penilaian_id',$id)->with(['mahasiswa','mahasiswa.programstudi']);
        return $data;
    }
    
    public function getPersentase($id,$assessment_id){
      $data = PenilaianAssessment::where('penilaian_id',$id)->where('assessment_id',$assessment_id)->first();
      if(!is_null($data)){
        return $data->value;  
      }else{
          return 0;
      }
    }
    
    public function getPengampuPenilai($id,$assessment_id){
        $data = PenilaianAssessment::where('penilaian_id',$id)->where('assessment_id',$assessment_id);
        return $data;
    }
    
    public function getKelompok($penilaian,$assessment){
        $data = PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)
                ->where('assessment_id',$assessment)
                ->where('status_jabatan',0)
                ->select('kelompok_mahasiswa')->distinct();
        return $data;
    }
    
    public function getKelompokList($penilaian,$assessment,$kelompok){
        $data = PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)
                ->where('assessment_id',$assessment)
                ->where('status_jabatan',0)
                ->where('kelompok_mahasiswa',$kelompok)->get();
        return $data;
    }
    
    public function deleteKelompokList($penilaian,$assessment,$kelompok){
        return PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)->where('assessment_id',$assessment)->where('kelompok_mahasiswa',$kelompok);
    }
    
    public function getMahasiswa($penilaian){
        $data = PenilaianHeader::find($penilaian);
        
    }
    
    public function deletePenilaiList($penilaian,$assessment){
        return PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)->where('assessment_id',$assessment)->where('status_jabatan',1);
    }
    
    public function getPenilaianAssessment($penilaian){
        return PenilaianAssessment::where('penilaian_id',$penilaian)->with(['assessment'])->get();
    }
    public function checkAssessmentDetail($penilaian_assessment){
        return PenilaianAssessmentDetail::where('penilaian_assessment_id',$penilaian_assessment);
    }
    
    public function getNilaiDetail($penilaian){
        return PenilaianAssessmentDetail::whereHas('penilaianAssessment',function ($q) use ($penilaian){
            $q->where('penilaian_id',$penilaian);
        });
    }
    
    public function showPenilaianAssessmentFind($id){
        return PenilaianAssessment::find($id);
    }
    
    public function listPenilaian(){
        if(Auth::user()->type == 2){
            $data = PenilaianHeader::whereHas('jadwal.matakuliah.programstudi.fakultas',function($q){
               $q->where('universitas_id',Auth::user()->universitas_id); 
            })->where('status',1)->get();
            
            return $data;
        }else{
            $data = PenilaianHeader::whereHas('penilaianAssessment.penilaianAssessmentDetail',function($q){
                $q->where('dosen_mahasiswa_id',Auth::user()->dosen->id);
            })->where('status',1)->get();
//            $data = PenilaianAssessmentDetail::where('dosen_mahasiswa_id',Auth::user()->dosen->id)
//                    ->whereHas('penilaianAssessment.penilaian',function($q){
//                        $q->where('status',1);
//                    })->distinct()
//                    ->get();
//           
            return $data;
        }
    }
    
    public function listAssessmentPenilaian($penilaian){
            $data = PenilaianAssessment::whereHas('penilaianAssessmentDetail',function($q){
                $q->where('dosen_mahasiswa_id',Auth::user()->dosen->id);
                })->where('penilaian_id',$penilaian)->with('assessment')->get();
        
//        $data = PenilaianHeader::whereHas('penilaianAssessment.penilaianAssessmentDetail',function($q){
//                $q->where('dosen_mahasiswa_id',Auth::user()->dosen->id);
//            })->whereHas('penilaianAssessment',function($q) use ($penilaian){
//                $q->where('penilaian_id',$penilaian);
//            })->where('status',1)->get();
        return $data;
    }
    
    public function showListItem($penilaianassessment){
        $data = PenilaianAssessmentDetail::where('dosen_mahasiswa_id',Auth::user()->dosen->id)
                ->where('penilaian_assessment_id',$penilaianassessment)
                ->get();
        
        return $data;
    }
    
    public function getMahasiswaKelompok($penilaian,$assessment){
        return PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)
                ->where('assessment_id',$assessment)
                ->where('dosen_mahasiswa_id',Auth::user()->dosen->id)->first();
    }
    public function getListMahasiswaKelompok($penilaian,$assessment,$kelompok){
        $data = PenilaianDosenMahasiswa::where('penilaian_id',$penilaian)
                ->where('assessment_id',$assessment)
                ->where('status_jabatan',0)
                ->where('kelompok_mahasiswa',$kelompok)
                ->where('dosen_mahasiswa_id','!=',Auth::user()->dosen->id)
                ->get();
        return $data;
    }
    
    public function checkPenilai($mahasiswa,$assessmentdetail){
        $data = PenilaianAssessmentNilai::where('penilaian_assessment_detail_id',$assessmentdetail)
                ->where('mahasiswa_dosen_id',$mahasiswa);
        return $data;
    }
    public function insertNilai(){
        return new PenilaianAssessmentNilai();
    }
    public function listNilai($assessmentdetail){
        $data = PenilaianAssessmentNilai::where('penilaian_assessment_detail_id',$assessmentdetail);
        return $data;
    }
    public function showPenilaianAssessmentDetail($assessmentdetail){
        return PenilaianAssessmentDetail::where('id',$assessmentdetail);
    }
    
    
    
    
    
    
    
    
    public function getList(){
        return Fakultas::where('universitas_id',Auth::user()->universitas_id)->get();
    }
    
    public function getData(Request $request){
        $data = Fakultas::where('universitas_id',Auth::user()->universitas_id)->where('status',0);
        if($request->has('q')){
            $data->where('fakultas_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    public function getListData(){
        $data = Fakultas::where('universitas_id',Auth::user()->universitas_id)->where('status',0)->get();
        return $data;
    }
    
    
    
    
    


}