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
    work_m_00000000003576266648_1379444059_init();
    work_m_00000000001530863039_1609735133_init();
    work_m_00000000002726828771_2521982126_init();
    work_m_00000000000448098577_2985348275_init();
    work_m_00000000003582234378_3431587616_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003582234378_3431587616");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}