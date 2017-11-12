/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002427005991_3092946469_init();
    work_m_00000000000603913667_0992280429_init();
    work_m_00000000002249475007_2734716317_init();
    work_m_00000000002527659174_2515875811_init();
    work_m_00000000001671252330_0132817699_init();
    work_m_00000000003203878186_0578944255_init();
    work_m_00000000003622974141_1750549319_init();
    work_m_00000000001262222767_2725559894_init();
    work_m_00000000001653122355_3392787015_init();
    work_m_00000000001710866810_3146803068_init();
    work_m_00000000002116515056_3393339049_init();
    work_m_00000000003948680359_2490172768_init();
    work_m_00000000002734010004_3415651129_init();
    work_m_00000000003582760488_2036194787_init();
    work_m_00000000000261135963_1547076159_init();
    work_m_00000000004073937634_3027548060_init();
    work_m_00000000003116196030_2943448091_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003116196030_2943448091");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}