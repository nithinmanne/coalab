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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/student/Desktop/1/test/teset.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {4, 0};
static int ng4[] = {0, 0};
static int ng5[] = {5, 0};
static int ng6[] = {1, 0};
static int ng7[] = {15, 0};
static int ng8[] = {2, 0};



static void Always_465_0(char *t0)
{
    char t6[8];
    char t26[8];
    char t37[8];
    char t38[8];
    char t39[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    int t47;
    char *t48;
    unsigned int t49;
    int t50;
    int t51;
    char *t52;
    unsigned int t53;
    int t54;
    int t55;
    unsigned int t56;
    int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    int t61;
    char *t62;
    char *t63;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(465, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(466, ng0);

LAB5:    xsi_set_current_line(467, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1608);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 16);
    xsi_set_current_line(468, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t5);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB9;

LAB6:    if (t16 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t20 = (t6 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t6);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(472, ng0);

LAB35:    xsi_set_current_line(473, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 3U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 3U);
    t5 = (t0 + 1608);
    t19 = (t0 + 1608);
    t20 = (t19 + 72U);
    t27 = *((char **)t20);
    t28 = ((char*)((ng6)));
    t29 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t26, t37, t38, ((int*)(t27)), 2, t28, 32, 1, t29, 32, 1);
    t36 = (t26 + 4);
    t13 = *((unsigned int *)t36);
    t47 = (!(t13));
    t40 = (t37 + 4);
    t14 = *((unsigned int *)t40);
    t50 = (!(t14));
    t51 = (t47 && t50);
    t41 = (t38 + 4);
    t15 = *((unsigned int *)t41);
    t54 = (!(t15));
    t55 = (t51 && t54);
    if (t55 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(474, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1008U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t19 = ((char*)((ng8)));
    xsi_vlog_generic_get_index_select_value(t37, 32, t3, t5, 2, t19, 32, 1);
    t20 = ((char*)((ng6)));
    memset(t38, 0, 8);
    t27 = (t37 + 4);
    t28 = (t20 + 4);
    t7 = *((unsigned int *)t37);
    t8 = *((unsigned int *)t20);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t27);
    t11 = *((unsigned int *)t28);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t27);
    t15 = *((unsigned int *)t28);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB41;

LAB38:    if (t16 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t38) = 1;

LAB41:    memset(t26, 0, 8);
    t36 = (t38 + 4);
    t21 = *((unsigned int *)t36);
    t22 = (~(t21));
    t23 = *((unsigned int *)t38);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t36) != 0)
        goto LAB44;

LAB45:    t41 = (t26 + 4);
    t30 = *((unsigned int *)t26);
    t31 = *((unsigned int *)t41);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB46;

LAB47:    t33 = *((unsigned int *)t26);
    t34 = (~(t33));
    t35 = *((unsigned int *)t41);
    t46 = (t34 || t35);
    if (t46 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t41) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t26) > 0)
        goto LAB52;

LAB53:    memcpy(t6, t43, 8);

LAB54:    t44 = (t0 + 1608);
    t45 = (t0 + 1608);
    t48 = (t45 + 72U);
    t52 = *((char **)t48);
    t62 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t39, t52, 2, t62, 32, 1);
    t63 = (t39 + 4);
    t49 = *((unsigned int *)t63);
    t47 = (!(t49));
    if (t47 == 1)
        goto LAB55;

LAB56:
LAB12:    goto LAB2;

LAB8:    t19 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(468, ng0);

LAB13:    xsi_set_current_line(469, ng0);
    t27 = (t0 + 1048U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t27 = (t26 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 0);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 0);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 31U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 31U);
    t36 = (t0 + 1608);
    t40 = (t0 + 1608);
    t41 = (t40 + 72U);
    t42 = *((char **)t41);
    t43 = ((char*)((ng3)));
    t44 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t37, t38, t39, ((int*)(t42)), 2, t43, 32, 1, t44, 32, 1);
    t45 = (t37 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (!(t46));
    t48 = (t38 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (!(t49));
    t51 = (t47 && t50);
    t52 = (t39 + 4);
    t53 = *((unsigned int *)t52);
    t54 = (!(t53));
    t55 = (t51 && t54);
    if (t55 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(470, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1008U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t19 = ((char*)((ng5)));
    xsi_vlog_generic_get_index_select_value(t37, 32, t3, t5, 2, t19, 32, 1);
    t20 = ((char*)((ng6)));
    memset(t38, 0, 8);
    t27 = (t37 + 4);
    t28 = (t20 + 4);
    t7 = *((unsigned int *)t37);
    t8 = *((unsigned int *)t20);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t27);
    t11 = *((unsigned int *)t28);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t27);
    t15 = *((unsigned int *)t28);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB19;

LAB16:    if (t16 != 0)
        goto LAB18;

LAB17:    *((unsigned int *)t38) = 1;

LAB19:    memset(t26, 0, 8);
    t36 = (t38 + 4);
    t21 = *((unsigned int *)t36);
    t22 = (~(t21));
    t23 = *((unsigned int *)t38);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t36) != 0)
        goto LAB22;

LAB23:    t41 = (t26 + 4);
    t30 = *((unsigned int *)t26);
    t31 = *((unsigned int *)t41);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB24;

LAB25:    t33 = *((unsigned int *)t26);
    t34 = (~(t33));
    t35 = *((unsigned int *)t41);
    t46 = (t34 || t35);
    if (t46 > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t41) > 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t26) > 0)
        goto LAB30;

LAB31:    memcpy(t6, t43, 8);

LAB32:    t44 = (t0 + 1608);
    t45 = (t0 + 1608);
    t48 = (t45 + 72U);
    t52 = *((char **)t48);
    t62 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t39, t52, 2, t62, 32, 1);
    t63 = (t39 + 4);
    t49 = *((unsigned int *)t63);
    t47 = (!(t49));
    if (t47 == 1)
        goto LAB33;

LAB34:    goto LAB12;

LAB14:    t56 = *((unsigned int *)t39);
    t57 = (t56 + 0);
    t58 = *((unsigned int *)t37);
    t59 = *((unsigned int *)t38);
    t60 = (t58 - t59);
    t61 = (t60 + 1);
    xsi_vlogvar_assign_value(t36, t26, t57, *((unsigned int *)t38), t61);
    goto LAB15;

LAB18:    t29 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB19;

LAB20:    *((unsigned int *)t26) = 1;
    goto LAB23;

LAB22:    t40 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB23;

LAB24:    t42 = ((char*)((ng6)));
    goto LAB25;

LAB26:    t43 = ((char*)((ng4)));
    goto LAB27;

LAB28:    xsi_vlog_unsigned_bit_combine(t6, 32, t42, 32, t43, 32);
    goto LAB32;

LAB30:    memcpy(t6, t42, 8);
    goto LAB32;

LAB33:    xsi_vlogvar_assign_value(t44, t6, 0, *((unsigned int *)t39), 1);
    goto LAB34;

LAB36:    t16 = *((unsigned int *)t38);
    t57 = (t16 + 0);
    t17 = *((unsigned int *)t26);
    t18 = *((unsigned int *)t37);
    t60 = (t17 - t18);
    t61 = (t60 + 1);
    xsi_vlogvar_assign_value(t5, t6, t57, *((unsigned int *)t37), t61);
    goto LAB37;

LAB40:    t29 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t26) = 1;
    goto LAB45;

LAB44:    t40 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB45;

LAB46:    t42 = ((char*)((ng6)));
    goto LAB47;

LAB48:    t43 = ((char*)((ng4)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t6, 32, t42, 32, t43, 32);
    goto LAB54;

LAB52:    memcpy(t6, t42, 8);
    goto LAB54;

LAB55:    xsi_vlogvar_assign_value(t44, t6, 0, *((unsigned int *)t39), 1);
    goto LAB56;

}


extern void work_m_00000000002734010004_3415651129_init()
{
	static char *pe[] = {(void *)Always_465_0};
	xsi_register_didat("work_m_00000000002734010004_3415651129", "isim/top_module_isim_beh.exe.sim/work/m_00000000002734010004_3415651129.didat");
	xsi_register_executes(pe);
}
